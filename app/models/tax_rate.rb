class TaxRate < ApplicationRecord
  belongs_to :nation
  has_many   :tax_ranges, dependent: :destroy

  validates_presence_of :nation_id
  validates :start_date, presence: true, uniqueness: { scope: :nation_id }
  validates :end_date, presence: true, uniqueness: { scope: :nation_id }

  default_scope { order(:start_date) }

  def self.calculate_income_tax(nation_code, payment_start_date, payment_end_date, annual_salary)
    tax_rate = find_tax_rate_by_nation_and_dates(nation_code, payment_start_date, payment_end_date)

    send("#{tax_rate.formula}_formula".to_sym, tax_rate, annual_salary)
  end

  def self.find_tax_rate_by_nation_and_dates(nation_code, payment_start_date, payment_end_date)
    nation_id  = Nation.select(:id).find_by_code(nation_code)

    tax_rate = where("nation_id = ? AND start_date <= ? AND end_date >= ?",
          nation_id, payment_start_date, payment_end_date).first

    return tax_rate if tax_rate.present?

    payment_end_date <= first.start_date ? first : last
  end

  def self.default_formula(tax_rate, annual_salary)
    tax_range = TaxRange.find_by_annual_salary(annual_salary)

    ((BigDecimal(tax_range.plus) +
    (BigDecimal(annual_salary.to_s) - BigDecimal(tax_range.start_range) - BigDecimal('1')) *
    BigDecimal(tax_range.rate)) /
    BigDecimal('12')).to_f.round
  end

end

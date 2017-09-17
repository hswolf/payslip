class Payslip
  include ActiveModel::Model

  MONTHS_IN_YEAR = 12

  attr_accessor :first_name, :last_name, :annual_salary, :super_rate,
                :payment_start_date, :payment_end_date, :nation

  validates_presence_of :first_name, :last_name, :annual_salary, :super_rate,
                        :payment_start_date, :payment_end_date, :nation
  validates :annual_salary, numericality: { only_integer: true,
                                            greater_than: 0 }
  validates :super_rate, numericality: { only_integer: true,
                                         greater_than_or_equal_to: 0,
                                         less_than_or_equal_to: 50 }
  validate :validate_format_of_dates
  validate :payment_start_date_cannot_greater_than_payment_end_date,
            if: ->(obj) { obj.payment_start_date.present? && obj.payment_end_date.present? }

  def gross_income
    (BigDecimal(annual_salary.to_s) / BigDecimal(MONTHS_IN_YEAR.to_s)).to_f.round
  end

  def income_tax
    TaxRate.calculate_income_tax(nation, payment_start_date, payment_end_date, annual_salary)
  end

  def net_income
    gross_income - income_tax
  end

  def super
    (BigDecimal(gross_income.to_s) * BigDecimal(super_rate.to_s) / BigDecimal(100.to_s)).to_f.round
  end

  private

  def payment_start_date_cannot_greater_than_payment_end_date
    if payment_start_date.to_date > payment_end_date.to_date
      errors.add(:payment_start_date, "must be before Payment End Date")
    end
  end

  def validate_format_of_dates
    payment_start_date.to_date rescue errors.add(:payment_start_date, "must be a date")
    payment_end_date.to_date rescue errors.add(:payment_end_date, "must be a date")
  end
end
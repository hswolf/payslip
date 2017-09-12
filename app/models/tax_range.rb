class TaxRange < ApplicationRecord
  belongs_to :tax_rate

  validates_uniqueness_of :start_range, scope: [:end_range, :tax_rate]

  default_scope { order(:start_range) }

  def self.find_by_annual_salary(annual_salary)
    where("(CAST(start_range as decimal) <= ?) AND (CAST(end_range as decimal) >= ? OR end_range = '')",
          annual_salary.to_f, annual_salary.to_f).first
  end
end

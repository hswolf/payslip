class Payslip
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :annual_salary, :super_rate,
                :payment_start_date, :payment_end_date
  attr_reader   :name, :payment_period, :gross

  validates_presence_of :first_name, :last_name, :annual_salary, :super_rate,
                        :payment_start_date, :payment_end_date
  validates :annual_salary, numericality: { only_integer: true,
                                            greater_than: 0 }
  validates :super_rate, numericality: { only_integer: true,
                                         greater_than_or_equal_to: 0,
                                         less_than_or_equal_to: 50 }
  validates_format_of :payment_start_date, :payment_end_date,
                      with: /\d{2}\/\d{2}\/\d{4}/,
                      message: "Date must be in the format: mm/dd/yyyy"
  validate :payment_start_date_cannot_greater_than_payment_end_date,
            if: ->(obj) { obj.payment_start_date.present? && obj.payment_end_date.present? }

  private

  def payment_start_date_cannot_greater_than_payment_end_date
    if payment_start_date.to_date > payment_end_date.to_date
      errors.add(:payment_start_date, "must be before Payment End Date")
    end
  end
end
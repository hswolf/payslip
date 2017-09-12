module PayslipsHelper
  def create_dates_from_month(month)
    [
      month.try(:to_date).try(:beginning_of_month),
      month.try(:to_date).try(:end_of_month)
    ]
  end

  def full_name(first_name, last_name)
    "#{first_name} #{last_name}"
  end

  def pay_period(payment_start_date)
    l(payment_start_date, format: :month)
  end
end

module PayslipsHelper
  def create_dates_from_month(month)
    [
      (month.try(:to_date).try(:beginning_of_month) rescue nil),
      (month.try(:to_date).try(:end_of_month) rescue nil)
    ]
  end

  def full_name(first_name, last_name)
    "#{first_name} #{last_name}"
  end

  def pay_period(date)
    l(date.to_date, format: :month)
  rescue
    ''
  end
end

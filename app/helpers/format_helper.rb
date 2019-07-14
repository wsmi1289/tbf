module FormatHelper
  def day_month(date)
    date.to_formatted_s(:short)
  end
end
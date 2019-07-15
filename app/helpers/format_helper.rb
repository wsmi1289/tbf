module FormatHelper
  def d_m_y(date)
    date.to_formatted_s(:long)
  end
end
module ApplicationHelper
  
  def format_date_t(date)
    date.strftime("%b %e, %Y")
  end

  def format_date_g(date)
    date.strftime("%b %e")
  end

  def format_time_g(time)
    time.strftime("%l:%M %P")
  end

end

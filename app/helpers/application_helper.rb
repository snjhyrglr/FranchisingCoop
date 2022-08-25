module ApplicationHelper
  def format_date(date, digits=nil)
    if digits == 2
      date.strftime('%d %b %y')
    else
      date.strftime('%d %b %Y')
    end
  end
end

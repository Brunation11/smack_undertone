module ApplicationHelper
  def user_profile_date(d)
    return "" unless d
    d.strftime("%b %e, %Y")
  end

  def question_datetime(d)
    return "" unless d
    d.strftime("%b %e\'%y at %l:%M")
  end
end

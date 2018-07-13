module ApplicationHelper

  def authen_form
    "<input type=\"hidden\" name=\"authenticity_token\" value=\"#{h(form_authenticity_token)}\"".html_safe
  end
end

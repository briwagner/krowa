module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def parse_xml(url)
    doc = Nokogiri::HTML(open(url))
    p doc
  end
end

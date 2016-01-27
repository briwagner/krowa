module ApplicationHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_friend?(potential_friend)
    current_user.friends.each do |friend|
      if friend.id == potential_friend
        return true
      end
    end
    false
  end

  def group_member?(user, group)
    return true if Membership.find_by(group_id: group, user_id: user) != nil
    return false
  end

  def request_sent?(id)
    FriendRequest.find_by(sender_id: session[:user_id], recipient_id: id, status: false)
  end

  def request_received?(id)
    FriendRequest.find_by(sender_id: id, recipient_id: session[:user_id], status: false)
  end

  def find_request(id)
    return FriendRequest.find_by(sender_id: session[:user_id], recipient_id: id) || FriendRequest.find_by(sender_id: id, recipient_id: session[:user_id])
  end

  def parse_xml(url)
    doc = Nokogiri::HTML(open(url))
    p doc
  end

  def sortable(column, title = nil)
    title ||=column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

  def manageable(id)
  	current_user.id == id.to_i
  end

end

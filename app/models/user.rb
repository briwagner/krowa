class User < ActiveRecord::Base
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :firstname, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password
  has_many :collections
  has_many :games, through: :collections
  has_many :reviews, foreign_key: :reviewer_id
  has_many :sent_requests, class_name: "FriendRequest", foreign_key: :sender_id
  has_many :received_requests, class_name: "FriendRequest", foreign_key: :recipient_id

  def friends
    all_friends= []
    self.sent_requests.each do |req|
      all_friends << User.find(req.recipient_id) if req.status == true
    end
    self.received_requests.each do |req|
      all_friends << User.find(req.sender_id) if req.status == true
    end
    all_friends
  end

  def is_admin?
    self.admin
  end

  def fullname
    self.firstname + " " + self.lastname
  end

end

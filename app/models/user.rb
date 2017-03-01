class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save { self.email = email.downcase }
  
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end

  validates :username, presence: true, 
  uniqueness: {case_sensitive: false}, 
  length: {minimum: 5, maximum: 25}
  
  validates :first_name, presence: true,  
  length: {minimum: 3, maximum: 25}
  
  validates :last_name, presence: true,  
  length: {minimum: 3, maximum: 25}
  
  validates :email, presence: true, length: { maximum: 105 },
  uniqueness: { case_sensitive: false }
  validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_secure_password
end
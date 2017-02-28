class Article < ActiveRecord::Base
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true, length: { minimum: 4, maximum: 150 } 
  validates :description, presence: true, length: { minimum: 10, maximum: 1500 } 
  validates :user_id, presence:true
end

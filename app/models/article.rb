class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, length: { minimum: 4, maximum: 150 } 
  validates :description, presence: true, length: { minimum: 10, maximum: 1500 } 
end

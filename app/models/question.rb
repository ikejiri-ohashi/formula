class Question < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_many :answers
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :comments
  
  validates :url, :time, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を選択してください" } 
end

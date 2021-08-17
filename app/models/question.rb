class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :question_categories
  has_many :question, through: :question_categories
  validates :url, :time, :text, :category_ids, presence: true
end

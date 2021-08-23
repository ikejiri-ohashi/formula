class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user
  validates :text, presence: true
end

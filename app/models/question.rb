class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :url, :time, :text, presence: true
end

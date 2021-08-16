class Question < ApplicationRecord
  belongs_to :user

  validates :url, :time, :text, presence: true
end

class Favorite < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  validates :answer_id, presence: true
end

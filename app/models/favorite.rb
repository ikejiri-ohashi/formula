class Favorite < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  validates :answer_id, uniqueness: user_id
end

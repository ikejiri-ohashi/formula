class Favorite < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  validates :answer_id, uniqueness: { scope: :user_id }
end

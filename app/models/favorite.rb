class Favorite < ApplicationRecord
  belongs_to :answer
  belongs_to :user
  validates :answer, presence: true, uniqueness: { scope: :user }
end

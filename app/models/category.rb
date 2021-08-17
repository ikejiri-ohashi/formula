class Category < ApplicationRecord
  has_many :question_categories
  has_many :question, through: :question_categories
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_questions, through: :likes, source: :question
  has_many :favorites, dependent: :destroy
  has_many :favorited_answers, through: :favorites, source: :answer
  has_many :comments, dependent: :destroy

  validates :nickname, presence: true

  def already_liked?(question)
    likes.exists?(question_id: question.id)
  end

  def already_favorited?(answer)
    favorites.exists?(answer_id: answer.id)
  end
end

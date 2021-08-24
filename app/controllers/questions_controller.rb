class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @questions = Question.order('created_at DESC')
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
    @answer = @question.answers.includes(:user)
    @like = Like.new
    @favorite = Favorite.new
    @comment = @question.comments.includes(:user)
  end

  private
  def question_params
    params.require(:question).permit(:url, :time, :text, :category_id).merge(user_id: current_user.id)
  end
end

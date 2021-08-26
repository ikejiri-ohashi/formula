class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: [:new, :create]
  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer_params)
    if @answer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != 1
  end
end

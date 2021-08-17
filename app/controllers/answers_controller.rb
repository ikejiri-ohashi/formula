class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      redirect_to root_path
    else
      render:index
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:text).merge(user_id: current_user.id, question_id)
end

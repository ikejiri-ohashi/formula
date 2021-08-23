class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, question_id: params[:question_id])
  end

end

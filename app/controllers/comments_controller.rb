class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @drill = @comment.drill
    unless @comment.save
      render 'error'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment)
          .permit(:comment)
          .merge(user_id: current_user.id, drill_id: params[:drill_id])
  end
end

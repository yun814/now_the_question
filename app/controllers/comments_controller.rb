class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to drill_path(comment.drill)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to drill_path(comment.drill)
  end

  private
  def comment_params
    params.require(:comment)
          .permit(:comment)
          .merge(user_id: current_user.id, drill_id: params[:drill_id])
  end
end

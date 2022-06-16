class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @genres = Genre.all
    @results = @user.results.order(created_at: 'DESC').limit(5)

    @public_drills = @user.drills.order(updated_at: 'DESC').where(status: 1)
    if user_signed_in? && @user.id == current_user.id
      @all_drills = @user.drills.order(updated_at: 'DESC')
      
    elsif user_signed_in?
      @side_results = current_user.results.order(created_at: 'DESC').limit(5)
    end
  end
end

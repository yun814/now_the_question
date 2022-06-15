class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @public_drills = @user.drills.order(updated_at: 'DESC').where(status: 1)
    @results = @user.results.order(created_at: 'DESC').limit(5)
    @genres = Genre.all
    if user_signed_in?
      @times_array_for_record = []
      @results.each do |result|
        @times_array_for_record << result.drill.results.where(user_id: current_user.id).count
      end

      @times_array_for_user = []
      @public_drills.each do |drill|
        @times_array_for_user << drill.results.where(user_id: current_user.id).count
      end

      @side_results = current_user.results.order(created_at: 'DESC').limit(5)

      if @user.id == current_user.id
        @all_drills = @user.drills.order(updated_at: 'DESC')
      end
    end
  end
end

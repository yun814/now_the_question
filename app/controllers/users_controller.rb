class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @results = @user.results.order(created_at: "DESC").limit(5)
    if user_signed_in?
      @times_array_for_record = []
      @results.each do |result|
        @times_array_for_record << result.drill.results.where(user_id: current_user.id).count
      end

      @times_array_for_user = []
      @user.drills.each do |drill|
        @times_array_for_record << drill.results.where(user_id: current_user.id).count
      end
    end
  end
end

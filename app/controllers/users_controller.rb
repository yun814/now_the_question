class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @results = @user.results.order(created_at: "DESC").limit(5)
  end
end

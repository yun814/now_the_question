class FavoritesController < ApplicationController
  before_action :set_drill

  def create
    Favorite.create(user_id: current_user.id, drill_id: @drill.id)
  end
  
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, drill_id: @drill.id)
    @favorite.destroy
  end

  private
  def set_drill
    @drill = Drill.find(params[:drill_id])
  end
end

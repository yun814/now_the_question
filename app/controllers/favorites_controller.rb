class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new(user_id: current_user.id, drill_id: @drill.id)
    @favorite.save
  end
  
  def destroy
    @favorite = Favorite.new(user_id: current_user.id, drill_id: @drill.id)
    @favorite.destroy
  end

  private
  def set_drill
    @drill = Drill.find(params[:drill_id])
  end
end

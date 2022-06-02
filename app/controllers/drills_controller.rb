class DrillsController < ApplicationController
  def index
    
  end

  def new
    @drill = Drill.new
  end

  def create
    @drill = Drill.new(drill_params)
    if @drill.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def drill_params
    params.require(:drill)
          .permit(:title, :genre_id, :information)
          .merge(user_id: current_user.id)
  end
end

class DrillsController < ApplicationController
  def index
    
  end

  def new
    @drill = Drill.new
  end
end

class DrillsController < ApplicationController
  def index
    @drills = Drill.all.order(id: "DESC")
    if user_signed_in?
      @times_array = []
      @drills.each do |drill|
        @times_array << drill.results.where(user_id: current_user.id).count
      end
    end
  end

  def new
    @drill = Drill.new
  end

  def create
    @drill = Drill.new(drill_params)
    if @drill.save
      redirect_to drill_path(@drill.id)
    else
      render :new
    end
  end

  def show
    @drill = Drill.find(params[:id])
    @quiz = Quiz.new
    @quizzes = @drill.quizzes.includes(:user)
    if user_signed_in?
      @results = @drill.results.order(created_at: "DESC").where(user_id: current_user.id)
    end
  end

  def edit
    @drill = Drill.find(params[:id])
  end

  def update
    @drill = Drill.new(drill_params)
    if @drill.save
      redirect_to drill_path(@drill.id)
    else
      render :edit
    end
  end

  def destroy
    drill = Drill.find(params[:id])
    drill.destroy
    redirect_to root_path
  end

  private
  def drill_params
    params.require(:drill)
          .permit(:title, :genre_id, :information)
          .merge(user_id: current_user.id)
  end
end

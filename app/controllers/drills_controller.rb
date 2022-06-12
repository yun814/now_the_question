class DrillsController < ApplicationController
  def index
    @drills = Drill.where(status: 1).order(id: 'DESC').includes(:user, :quizzes)
    @genres = Genre.all
    if user_signed_in?
      @times_array = []
      @drills.each do |drill|
        @times_array << drill.results.where(user_id: current_user.id).count
      end
      @side_results = current_user.results.order(created_at: 'DESC').limit(5)
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
    @quizzes = @drill.quizzes
    @genres = Genre.all
    if user_signed_in?
      @results = @drill.results.order(created_at: 'DESC').where(user_id: current_user.id)
      @side_results = current_user.results.order(created_at: 'DESC').limit(5)
    end
  end

  def edit
    @drill = Drill.find(params[:id])
  end

  def update
    @drill = Drill.find(params[:id])
    @drill.update(drill_params)
    if @drill.save
      redirect_to drill_path(@drill.id)
    else
      render :edit
    end
  end

  def destroy
    drill = Drill.find(params[:id])
    drill.destroy
    redirect_to user_path(current_user)
  end

  def publish
    drill = Drill.find(params[:id])
    if drill.status == 0
      drill.status = 1
      drill.save
    else
      drill.status = 0
      drill.save
    end
    redirect_to drill_path(drill)
  end

  private

  def drill_params
    params.require(:drill)
          .permit(:title, :genre_id, :information)
          .merge(user_id: current_user.id)
  end
end

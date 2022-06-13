class DrillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_drill, only: [:show, :edit, :update, :destroy, :publish]
  before_action :set_genres, only: [:index, :show]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @drills = Drill.where(status: 1).order(id: 'DESC').includes(:user, :quizzes)
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
    @quiz = Quiz.new
    @quizzes = @drill.quizzes
    if user_signed_in?
      @results = @drill.results.order(created_at: 'DESC').where(user_id: current_user.id)
      @side_results = current_user.results.order(created_at: 'DESC').limit(5)
    end
  end

  def edit
  end

  def update
    @drill.update(drill_params)
    if @drill.save
      redirect_to drill_path(@drill.id)
    else
      render :edit
    end
  end

  def destroy
    @drill.destroy
    redirect_to user_path(current_user)
  end

  def publish
    if @drill.status == 0
      @drill.status = 1
      @drill.save
    else
      @drill.status = 0
      @drill.save
    end
    redirect_to drill_path(@drill)
  end

  private
  def drill_params
    params.require(:drill)
          .permit(:title, :genre_id, :information)
          .merge(user_id: current_user.id)
  end

  def set_drill
    @drill = Drill.find(params[:id])
  end

  def set_genres
    @genres = Genre.all
  end

  def move_to_index
    unless current_user.id == @drill.user_id
      redirect_to root_path
    end
  end
end

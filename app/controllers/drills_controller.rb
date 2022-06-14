class DrillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_drill, only: [:show, :edit, :update, :destroy, :publish]
  before_action :set_side_results, only: [:index, :show, :search, :genre]
  before_action :set_genres, only: [:index, :show, :search, :genre]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @drills = Drill.where(status: 1).order(updated_at: 'DESC').includes(:user, :quizzes)
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
    @quiz = Quiz.new
    @quizzes = @drill.quizzes
    if user_signed_in?
      @results = @drill.results.order(created_at: 'DESC').where(user_id: current_user.id)
      @favorite = Favorite.find_by(user_id: current_user.id, drill_id: @drill.id)
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

  def search
    @drills_searched_by_title = Drill.search_by_title(params[:keyword])
    
    if user_signed_in?
      @times_array = []
      @drills_searched_by_title.each do |drill|
        @times_array << drill.results.where(user_id: current_user.id).count
      end
      
      unless params[:keyword] == ""
        @drills_searched_by_info = Drill.search_by_info(params[:keyword])
        @times_array_by_info = []
        @drills_searched_by_info.each do |drill|
          @times_array_by_info << drill.results.where(user_id: current_user.id).count
        end

        @users = User.search_by_user(params[:keyword])
        @drills_searched_by_user = Drill.where(user_id: @users.ids).order(updated_at: 'DESC')
        @times_array_by_user = []
        @drills_searched_by_user.each do |drill|
          @times_array_by_user << drill.results.where(user_id: current_user.id).count
        end
      end
    end
  end

  def genre
    @genre = Genre.find(params[:id])
    @drills = Drill.where(status: 1, genre_id: @genre.id).order(updated_at: 'DESC').includes(:user, :quizzes)
    if user_signed_in?
      @times_array = []
      @drills.each do |drill|
        @times_array << drill.results.where(user_id: current_user.id).count
      end
    end
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
  
  def set_side_results
    if user_signed_in?
      @side_results = current_user.results.order(created_at: 'DESC').limit(5)
    end
  end

  def move_to_index
    unless current_user.id == @drill.user_id
      redirect_to root_path
    end
  end
end

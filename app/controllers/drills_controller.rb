class DrillsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_drill, only: [:show, :edit, :update, :destroy, :publish]
  before_action :set_side_results, only: [:index, :show, :search, :genre, :rank, :drill_rank]
  before_action :set_genres, only: [:index, :show, :search, :genre, :rank, :drill_rank]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @drills = Drill.where(status: 1).order(updated_at: 'DESC').includes(:user, :quizzes, :favorites)
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
    @comments = @drill.comments.order(created_at: 'DESC').includes(:user)
    if user_signed_in?
      @comment = Comment.new
      @mylist = Mylist.new
      @mylists = Mylist.where(user_id: current_user.id)
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
      render 'publish'
    else
      @drill.status = 0
      @drill.save
      render 'not_publish'
    end
  end

  def timer
    @drill = Drill.find(params[:id])
    @drill.timer = params[:timer]
    @drill.save
    render :show
  end

  def search
    @drills_searched_by_title = Drill.search_by_title(params[:keyword]).includes(:user, :quizzes, :favorites)
    unless params[:keyword] == ""
      @drills_searched_by_info = Drill.search_by_info(params[:keyword]).includes(:user, :quizzes, :favorites)
      @users = User.search_by_user(params[:keyword])
      @drills_searched_by_user = Drill.where(user_id: @users.ids).order(updated_at: 'DESC').includes(:user, :quizzes, :favorites)
    end
  end

  def genre
    @genre = Genre.find(params[:id])
    @drills = Drill.where(status: 1, genre_id: @genre.id).order(updated_at: 'DESC').includes(:user, :quizzes, :favorites)
  end

  def rank
    if params[:type_id] == "1"
      @type = "解答回数"
      @drills = Drill.where(status: 1).left_joins(:results).group('id').order('count(results.id) desc').includes(:user, :quizzes, :favorites).limit(100)
    elsif params[:type_id] == "2"
      @type = "いいね獲得数"
      @drills = Drill.where(status: 1).left_joins(:favorites).group('id').order('count(favorites.id) desc').includes(:user, :quizzes, :favorites).limit(100)
    end

    if user_signed_in?
      @my_drills = current_user.drills
    end
  end

  def drill_rank
    @drill = Drill.find(params[:id])
    @first_results = @drill.results.where(times: 1).order(correct_answer_rate: 'DESC')
    @all_results = @drill.results.order(correct_answer_rate: 'DESC')

    if user_signed_in?
      @my_first_result = @drill.results.find_by(user_id: current_user.id, times: 1)
      @my_all_results = @drill.results.where(user_id: current_user.id)
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

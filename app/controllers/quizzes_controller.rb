class QuizzesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :set_drill, only: [:index, :create, :edit, :update, :destroy]
  before_action :set_quizzes, only: :index
  before_action :set_quiz, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @times = @drill.results.where(user_id: current_user.id).count
    @result = Result.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    unless @quiz.save
      render 'create_error'
    end
  end

  def edit
  end

  def update
    @quiz.update(quiz_params)
    unless @quiz.save
      render 'update_error'
    end
  end

  def destroy
    @quiz.destroy
    redirect_to drill_path(@quiz.drill_id)
  end

  private
  def quiz_params
    params.require(:quiz)
          .permit(:question, :choices_1, :choices_2, :choices_3, :choices_4, :correct_answer)
          .merge(drill_id: params[:drill_id], user_id: current_user.id)
  end

  def set_drill
    @drill = Drill.find(params[:drill_id])
  end

  def set_quizzes
    @quizzes = @drill.quizzes
  end

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end
  
  def move_to_index
    unless current_user.id == @drill.user_id
      redirect_to root_path
    end
  end
end

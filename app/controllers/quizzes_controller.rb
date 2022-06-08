class QuizzesController < ApplicationController
  def index
    @drill = Drill.find(params[:drill_id])
    @quizzes = @drill.quizzes.includes(:user)
    @times = @drill.results.where(user_id: current_user.id).count
    @result = Result.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to drill_path(@quiz.drill.id)
    else
      @drill = Drill.find(params[:drill_id])
      @quizzes = @drill.quizzes.includes(:user)
      render "drills/show"
    end
  end

  private
  def quiz_params
    params.require(:quiz)
          .permit(:question, :choices_1, :choices_2, :choices_3, :choices_4, :correct_answer)
          .merge(drill_id: params[:drill_id], user_id: current_user.id)
  end
end

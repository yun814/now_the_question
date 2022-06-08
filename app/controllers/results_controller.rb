class ResultsController < ApplicationController
  def index
    @drill = Drill.find(params[:drill_id])
    @quizzes = @drill.quizzes.includes(:user)
    @result = Result.order(created_at: "DESC").find_by(drill_id: @drill.id, user_id: current_user.id)
  end

  def create
    result = Result.new(result_params)
    if result.save
      redirect_to drill_results_path(params[:drill_id])
    else
      render 'quiz/index'
    end
  end

  private
  def result_params
    params.permit(:times, :number_of_questions, :number_of_correct_answers, :correct_answer_rate)
          .merge(user_id: current_user.id, drill_id: params[:drill_id])
  end
end

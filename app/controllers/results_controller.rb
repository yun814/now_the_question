class ResultsController < ApplicationController
  def index
    @drill = Drill.find(params[:drill_id])
    @quizzes = @drill.quizzes.includes(:user)
    @result = Result.order(created_at: "DESC").find_by(drill_id: @drill.id, user_id: current_user.id)
  end

  def create
    result = Result.new(result_params)
    if result.save
      update_record
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

  def update_record
    record = Record.find_by(user_id: current_user.id)
    record.update(record_hash)
  end
  
  def record_hash
    first_number_of_questions = current_user.results.where(times: 1).sum(:number_of_questions)
    first_number_of_correct_answers = current_user.results.where(times: 1).sum(:number_of_correct_answers)
    first_correct_answer_rate = (first_number_of_correct_answers / first_number_of_questions) * 100
    all_number_of_questions = current_user.results.sum(:number_of_questions)
    all_number_of_correct_answers = current_user.results.sum(:number_of_correct_answers)
    all_correct_answer_rate = (all_number_of_correct_answers / all_number_of_questions) * 100
    record_hash = {
      first_number_of_questions: first_number_of_questions,
      first_number_of_correct_answers: first_number_of_correct_answers
      first_correct_answer_rate: first_correct_answer_rate
      all_number_of_questions: all_number_of_questions
      all_number_of_correct_answers: all_number_of_correct_answers
      all_correct_answer_rate: all_correct_answer_rate
    }
  end
end

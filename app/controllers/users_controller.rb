class UsersController < ApplicationController
  before_action :set_genres
  before_action :set_side_results

  def show
    @user = User.find(params[:id])
    @results = @user.results.order(created_at: 'DESC').limit(5)
    
    @public_drills = @user.drills.order(updated_at: 'DESC').where(status: 1)
    if user_signed_in? && @user.id == current_user.id
      @all_drills = @user.drills.order(updated_at: 'DESC')
    end
  end
  
  def rank
    if params[:type_id] == "1"
      @type = '初見正解率'
      @records = Record.where(first_number_of_questions: 10..).order(first_correct_answer_rate: "DESC").limit(100)
      @all_records = Record.where(first_number_of_questions: 10..).order(first_correct_answer_rate: "DESC")
    elsif params[:type_id] == "2"
      @type = '全体正解率'
      @records = Record.where(all_number_of_questions: 10..).order(all_correct_answer_rate: "DESC").limit(100)
      @all_records = Record.where(all_number_of_questions: 10..).order(all_correct_answer_rate: "DESC")
    else
      @type = 'いいね獲得数'
    end
    
    if user_signed_in?
      @my_record = Record.find_by(user_id: current_user)
    end
  end
  
  private
  def set_genres
    @genres = Genre.all
  end

  def set_side_results
    if user_signed_in?
      @side_results = current_user.results.order(created_at: 'DESC').limit(5)
    end
  end
end

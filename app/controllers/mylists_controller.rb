class MylistsController < ApplicationController
  before_action :set_mylist, only: [:show, :destroy, :remove]
  before_action :move_to_index, only: [:destroy, :remove]

  def create
    @mylist = Mylist.new(mylist_params)
    if @mylist.save
      MylistDrill.create(mylist_id: @mylist.id, drill_id: params[:drill_id])
    else
      render 'create_error'
    end
  end

  def add
    @added = MylistDrill.find_by(mylist_id: params[:mylist_id], drill_id: params[:drill_id])
    if @added.present?
      render 'added'
    else
      if params[:mylist_id] == ""
        render 'add_error'
      else
        @mylist_drill = MylistDrill.create(mylist_id: params[:mylist_id], drill_id: params[:drill_id])
      end
    end
  end

  def show
    @genres = Genre.all
    if user_signed_in?
      @side_results = current_user.results.order(created_at: 'DESC').limit(5)
    end
  end

  def destroy
    @mylist.destroy
  end
  
  def remove
    @mylist_drill = MylistDrill.find_by(mylist_id: params[:mylist_id], drill_id: params[:drill_id])
    @mylist_drill.destroy
  end
  
  private
  def mylist_params
    params.require(:mylist)
    .permit(:title)
    .merge(user_id: current_user.id)
  end
  
  def set_mylist
    @mylist = Mylist.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @mylist.user_id
      redirect_to root_path
    end
  end
end

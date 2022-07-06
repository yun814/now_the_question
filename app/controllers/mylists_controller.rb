class MylistsController < ApplicationController
  def create
    @mylist = Mylist.new(mylist_params)
    if @mylist.save
      MylistDrill.create(mylist_id: @mylist.id, drill_id: params[:drill_id])
    end
  end

  private
  def mylist_params
    params.require(:mylist)
          .permit(:title)
          .merge(user_id: current_user.id)
  end
end

class MylistsController < ApplicationController
  def create
    @mylist = Mylist.new(mylist_params)
    
  end
end

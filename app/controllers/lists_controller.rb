class ListsController < ApplicationController
  #index action to return all lists
  def index
    @lists = List.all
    render :index
  end
  #action to show details of a particular list
   def show
      @list = List.find(params[:id])
      render :show
    end
   #action to create a new list
   def new
      @list = List.new
      render :new
    end 
end

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
   #action to render a new list form
   def new
      @list = List.new
      render :new
    end
    #action to create a new list
   def create
      @list = List.new(list_params)
      if @list.save
        redirect_to  lists_path
      else
        render :new
      end
    end

    #controller action to handle the edit page
    def edit
      @list = List.find(params[:id])
      render :edit
    end

   #The private method used by strong parameters,
   #permit only designated params to be passed for our model
  private
    def list_params
      params.require(:list).permit(:name)
    end
end

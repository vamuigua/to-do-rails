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
      	#flash notice on successful creation of a list
      	flash[:notice] = "List successfully added!"
        redirect_to  lists_path(@list)
      else
        render :new
      end
    end

    #controller action to handle the edit page
    def edit
      @list = List.find(params[:id])
      render :edit
    end

    #action to update the particular list according to its id
    def update
      @list= List.find(params[:id])
      if @list.update(list_params)
      	flash[:notice] = "List successfully updated!"
        redirect_to lists_path
      else
        render :edit
      end
    end

    #destroy controller action
    def destroy
      @list = List.find(params[:id])
      @list.destroy
      flash[:notice] = "List successfully destroyed!"
      redirect_to lists_path
    end

   #The private method used by strong parameters,
   #permit only designated params to be passed for our model
   #used by create and update actions
  	private
     def list_params
      params.require(:list).permit(:name)
     end
end

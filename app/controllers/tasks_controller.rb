class TasksController < ApplicationController
    #controller to render page for creating a task for a list
    def new
      @list = List.find(params[:list_id])
      @task = @list.tasks.new
    end

    #controller for creating a task for a particular list
    def create
      @list = List.find(params[:list_id])
      @task = @list.tasks.new(task_params)
      if @task.save
        redirect_to list_path(@task.list)
      else
        render :new
      end
    end

    #controller action to handle the edit page
    def edit
      @list = List.find(params[:list_id])
      @task = Task.find(params[:id])
      render :edit
    end

    #action to update the particular task according to its id
    def update
      @list = List.find(params[:list_id])
      @task = @list.tasks.find(params[:id])
      if @task.update(task_params)
        redirect_to list_path(@list)
      else
        render :edit
      end
    end

    #action controller to delete a particular task for a list
    def destroy
      @list = List.find(params[:list_id])
      @task = @list.tasks.find(params[:id])
      @task.destroy
      redirect_to list_path(@list)
    end

   #The private method used by strong parameters,
   #permits only designated params to be passed for our model
   #used by create and update actions 
  private
    def task_params
      params.require(:task).permit(:description)
    end
  end
  
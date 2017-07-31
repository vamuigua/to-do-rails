class TasksController < ApplicationController
    def new
      @list = List.find(params[:list_id])
      @task = @list.tasks.new
    end
  end
  
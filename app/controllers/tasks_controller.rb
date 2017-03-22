class TasksController < ApplicationController
  def index

    @tasks = Task.all
    # @tasks = [
    #   { monday: "chores"},
    #   { tuesday: "shopping"},
    #   { wednesday: "climb Mt. Rainier"},
    #   { thursday: "sleep"},
    #   { friday: "nap"}
    # ]
  end

  def show
    @result_task = Task.find(params[:id])
  end

  def new
    @task = Task.new name: "default task"
  end

  def create
    task = Task.create name: params[:task][:name], description: params[:task][:description], completion_date:  params[:task][:completion_date]


      redirect_to tasks_path
  end


end

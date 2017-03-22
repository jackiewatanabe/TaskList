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
    task = Task.create task_params

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completion_date)
  end

end

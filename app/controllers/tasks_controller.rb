class TasksController < ApplicationController
  def index

    @tasks = Task.all
    @tasks = Task.order(:complete)

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
    @task = Task.new
  end

  def create
    task = Task.create task_params

    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if params[:task][:name] !=nil
      task.name = params[:task][:name]
    end
    if params[:task][:description] != nil
      task.description = params[:task][:description]
    end
    task.complete = params[:task][:complete]

    if task.complete
      task.completion_date = DateTime.now
      # task.completion_date = params[:task][:updated_at]
    else
      task.completion_date = nil
      # params[:task][:updated_at].to_datetime
    end

    if task.save
      redirect_to tasks_path
    end
  end

  def destroy
    Task.destroy(params[:id])

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :complete)
  end

end

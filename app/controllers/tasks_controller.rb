class TasksController < ApplicationController
  before_action :find_task
  def index
    @tasks = Task.unfinished
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save!
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  def finished
    @tasks = Task.finished
    render :index
  end


  private

  def find_task
    @task = Task.where(id: params[:id]).first if params[:id]
  end

  def task_params
    params.require(:task).permit(%i(title detail finished))
  end

end

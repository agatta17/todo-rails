class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    title = params.require(:title)
    task = Task.create(title: title, done: false)
    redirect_to root_path, status: :see_other
    HardJob.perform_at(Time.zone.today.end_of_day, task.id)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to root_path, status: :see_other
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path, status: :see_other
  end

  private
  def task_params
    params.require(:task).permit(:done)
  end
end

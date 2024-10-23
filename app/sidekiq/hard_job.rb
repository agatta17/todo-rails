class HardJob
  include Sidekiq::Job

  def perform(task_id)
    task = Task.find(task_id)
    task.destroy!
  end
end

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task.user_id = params[:user_id]
    @task.email_reminder_repeat = params[:email_reminder_repeat]
    @task.email_reminder_num = params[:email_reminder_num]
    @task.email_reminder = params[:email_reminder]
    @task.recurrence_end_num = params[:recurrence_end_num]
    @task.recurrence_end_period = params[:recurrence_end_period]
    @task.recurrence_frequency_period = params[:recurrence_frequency_period]
    @task.recurrence_frequency_num = params[:recurrence_frequency_num]
    @task.recurrence = params[:recurrence]
    @task.notes = params[:notes]
    @task.date = Chronic.parse(params[:date])
    @task.name = params[:name]





    if @task.save
      @task_occurrence = TaskOccurrence.new
    @task_occurrence.complete = false
    @task_occurrence.task_id = @task.id
    @task_occurrence.save
      redirect_to "/tasks", :notice => "Task created successfully."
         else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.user_id = params[:user_id]
    @task.email_reminder_repeat = params[:email_reminder_repeat]
    @task.email_reminder_num = params[:email_reminder_num]
    @task.email_reminder = params[:email_reminder]
    @task.recurrence_end_num = params[:recurrence_end_num]
    @task.recurrence_end_period = params[:recurrence_end_period]
    @task.recurrence_frequency_period = params[:recurrence_frequency_period]
    @task.recurrence_frequency_num = params[:recurrence_frequency_num]
    @task.recurrence = params[:recurrence]
    @task.notes = params[:notes]
    @task.date = params[:date]
    @task.name = params[:name]

    if @task.save
      redirect_to "/tasks", :notice => "Task updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    redirect_to "/tasks", :notice => "Task deleted."
  end
end

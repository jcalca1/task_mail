class TaskOccurrencesController < ApplicationController
  def index
    @task_occurrences = TaskOccurrence.all
  end

  def show
    @task_occurrence = TaskOccurrence.find(params[:id])
  end

  def new
    @task_occurrence = TaskOccurrence.new
  end

  def create
    @task_occurrence = TaskOccurrence.new
    @task_occurrence.complete = params[:complete]
    @task_occurrence.task_id = params[:task_id]

    if @task_occurrence.save
      redirect_to "/task_occurrences", :notice => "Task occurrence created successfully."
    else
      render 'new'
    end
  end

  def edit
    @task_occurrence = TaskOccurrence.find(params[:id])

  end

  def update
    @task_occurrence = TaskOccurrence.find(params[:id])
    @task_occurrence.task_id = params[:task_id]
    @task_occurrence.complete = params[:complete]
    @task_occurrence.task_next_num = params[:task_next_num]
    @task_occurrence.task_next_date = params[:task_next_date]
    @task_occurrence.complete_date = params[:complete_date]

    #if @task_occurence.complete == false
      #@task_occurence.complete = true
    #else
      #@task_occurence.complete = false
    #end


    if @task_occurrence.save
      redirect_to :back, :notice => "Task occurrence updated successfully."
    else
      render 'edit'
    end


  end

  def done
    @task_occurrence = TaskOccurrence.find(params[:id])

    @task_occurrence.complete = params[:complete]
    @task_occurrence.task_id = params[:task_id]

    if @task_occurrence.save
      redirect_to "/task_occurrences", :notice => "Task occurrence updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @task_occurrence = TaskOccurrence.find(params[:id])

    @task_occurrence.destroy

    redirect_to "/task_occurrences", :notice => "Task occurrence deleted."
  end
end

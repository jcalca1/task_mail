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
      @task.name = params[:name]
      @task.date = Chronic.parse(params[:date])
      @task.recurrence = params[:recurrence]
      @task.notes = params[:notes]
      if @task.recurrence == true
         @task.recurrence_frequency_period = params[:recurrence_frequency_period]
         @task.recurrence_frequency_num = params[:recurrence_frequency_num]
         @task.recurrence_end_num = params[:recurrence_end_num]
    else
         @task.recurrence = false
         @task.recurrence_frequency_period = ""
         @task.recurrence_frequency_num = 1
         @task.recurrence_end_num = 1
    end
    @task.recurrence_end_period = params[:recurrence_end_period] ## not used
   @task.email_reminder_repeat = params[:email_reminder_repeat] ##not used
    @task.email_reminder_num = params[:email_reminder_num] ##not used
    @task.email_reminder = params[:email_reminder] ##not used
    if @task.save
         num = 0
      freq = @task.recurrence_frequency_period ##Daily, monthly, weekly
      every = @task.recurrence_frequency_num ## Monthly every 3 Months
      long = @task.recurrence_end_num ##number of occurrence
      date = @task.date
      while num < @task.recurrence_end_num do
       @task_occurrence = TaskOccurrence.new
       @task_occurrence.complete = 'false'
       @task_occurrence.task_next_num = num
       @task_occurrence.task_next_date = date
       @task_occurrence.complete_date = 'nil'
       @task_occurrence.task_id = @task.id
       @task_occurrence.save
       num += 1
       if freq.to_s == "dailly"
          date += every.day
     elsif freq.to_s == "weekly"
          date += every.week
     elsif freq.to_s == "monthly"
      date += every.month
 elsif freq.to_s == "yearly"
  date += every.year
end
end
redirect_to "/tasks", :notice => "Task created successfully."
else
 render 'new'
end
end


def edit
   @task = Task.find(params[:id])
end

def update #
   @task = Task.find(params[:id])
   @task.user_id = params[:user_id]
   @task.email_reminder_repeat = params[:email_reminder_repeat]
   @task.email_reminder_num = params[:email_reminder_num]
   @task.email_reminder = params[:email_reminder]
   @task.notes = params[:notes]
   @task.date = Chronic.parse(params[:date])
   @task.name = params[:name]
   @task.recurrence = params[:recurrence]
   if @task.recurrence == true
          @task.recurrence_frequency_num = params[:recurrence_frequency_num]
          @task.recurrence_frequency_period = params[:recurrence_frequency_period]
          @task.recurrence_end_period = params[:recurrence_end_period]
          @task.recurrence_end_num = params[:recurrence_end_num]
     else
           @task.recurrence_frequency_num = 1
          @task.recurrence_frequency_period = ""
          @task.recurrence_end_period = 1
          @task.recurrence_end_num = 1
     end

@task.notes = params[:notes]
@task.date = Chronic.parse(params[:date])
@task.name = params[:name]

     if @task.save
               @task.task_occurrences.each do |task_occurrence|
               if task_occurrence.complete == false
                    task_occurrence.destroy
               else
               end
                end

                    num = 0
                        freq = @task.recurrence_frequency_period ##Daily, monthly, weekly
                        every = @task.recurrence_frequency_num ## Monthly every 3 Months
                        long = @task.recurrence_end_num ##number of occurrence
                        date = @task.date
                        while num < @task.recurrence_end_num do
                           @task_occurrence = TaskOccurrence.new
                           @task_occurrence.complete = 'false'
                           @task_occurrence.task_next_num = num
                           @task_occurrence.task_next_date = date
                           @task_occurrence.complete_date = 'nil'
                           @task_occurrence.task_id = @task.id
                               if  @task_occurrence.task_next_date < Time.now
                           else
                              @task_occurrence.save
                              end

                         num += 1

                         if freq.to_s == "dailly"
                              date += every.day
                         elsif freq.to_s == "weekly"
                              date += every.week
                         elsif freq.to_s == "monthly"
                              date += every.month
                         elsif freq.to_s == "yearly"
                              date += every.year
                         end
                         end####


redirect_to "/tasks", :notice => "Task updated successfully."

else##
    render 'edit'
end##
end #




def destroy
   @task = Task.find(params[:id])
   @task.destroy
   redirect_to "/tasks", :notice => "Task deleted."
end
end

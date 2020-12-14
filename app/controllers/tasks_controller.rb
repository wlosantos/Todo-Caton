class TasksController < ApplicationController

  before_action :set_task, only: [:edit, :update, :destroy]

  def index
    @tasks = Task.orderPrazo
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Tarefa criada com sucesso!!!'
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Tarefa atualizada com sucesso!!!'
    else
      flash.now[:alert] = @task.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, alert: 'Tarefa removida com sucesso!'
  end

   private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:description, :due_date, :done)
  end
end

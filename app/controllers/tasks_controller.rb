class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_task_list, only: [:new, :create ]

  # GET /tasks
  # GET /tasks.json
  def index

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new

  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.task_list = @task_list
    respond_to do |format|
      if @task.save
        @task.task_list.touch
        format.html { redirect_to @task.task_list, notice: t('application.controller.task.create') }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        @task.task_list.touch
        format.html { redirect_to @task.task_list, notice: t('application.controller.task.update') }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      @task.task_list.touch
      format.html { redirect_to @task.task_list, notice: t('application.controller.task.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      begin
      @task = Task.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_url, notice: t('application.controller.task.set_task')
      end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task_list_id, :description, :status, :priority, :percentage_of_completion, :type, :start_at, :end_at)
    end

    def set_task_list
      begin
        @task_list = TaskList.friendly.find(params[:task_list_id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_url, notice: t('application.controller.set_task_list')
      end
    end

end

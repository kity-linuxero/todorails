class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :edit, :update, :destroy]
  before_action :destroy_from_cookie, only: [:destroy]
  before_action :list_ids, only: [:index, :new]
  after_action :save_in_cookie, only: [:create]

  # GET /task_lists
  # GET /task_lists.json
  def index
    @task_lists = TaskList.find(list_ids)
  end

  # GET /task_lists/1
  # GET /task_lists/1.json
  def show
  end

  # GET /task_lists/new
  def new
    @task_list = TaskList.new
    @last_list_tasks = TaskList.find(list_ids).last(5)
  end

  # GET /task_lists/1/edit
  def edit
  end

  # POST /task_lists
  # POST /task_lists.json
  def create
    @task_list = TaskList.new(task_list_params)

    respond_to do |format|
      if @task_list.save
        format.html { redirect_to @task_list, notice: 'Task list was successfully created.' }
        format.json { render :show, status: :created, location: @task_list }
      else
        format.html { render :new }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_lists/1
  # PATCH/PUT /task_lists/1.json
  def update
    respond_to do |format|
      if @task_list.update(task_list_params)
        format.html { redirect_to @task_list, notice: 'Task list was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_list }
      else
        format.html { render :edit }
        format.json { render json: @task_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_lists/1
  # DELETE /task_lists/1.json
  def destroy
    @task_list.destroy
    respond_to do |format|
      format.html { redirect_to task_lists_url, notice: 'Task list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_list
      @task_list = TaskList.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_list_params
      params.require(:task_list).permit(:name, :id)
    end

    def save_in_cookie
      cookies[@task_list.id] = @task_list.name
    end

    def destroy_from_cookie
      cookies.delete (@task_list.id)
    end

    def list_ids
      a= cookies.select { |x| x[0].to_s.match(/^\d+$/) }
      Hash[a].keys
    end
end

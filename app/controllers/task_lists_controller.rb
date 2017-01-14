class TaskListsController < ApplicationController
  before_action :set_task_list, only: [:show, :edit, :update, :destroy]
  after_action :destroy_from_cookie, only: [:destroy]
  before_action :list_ids, only: [:index, :new]
  after_action :save_in_cookie, only: [:create]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  # GET /task_lists
  # GET /task_lists.json
  def index
    begin
    @task_lists = TaskList.find(list_ids)
    rescue ActiveRecord::RecordNotFound
      purge_invalid_cookies
  end
  end

  # GET /task_lists/1
  # GET /task_lists/1.json
  def show
  end

  # GET /task_lists/new
  def new
    @task_list = TaskList.new
    begin
    @last_list_tasks = TaskList.find(list_ids).last(5)
    rescue ActiveRecord::RecordNotFound
      purge_invalid_cookies
      retry
    end
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
        format.html { redirect_to @task_list, notice: t('application.controller.task_list.create') }
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
        format.html { redirect_to @task_list, notice: t('application.controller.task_list.update') }
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
      format.html { redirect_to task_lists_url, notice: t('application.controller.task_list.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_list
      begin
        @task_list = TaskList.friendly.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_url, notice: t('application.controller.set_task_list')
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_list_params
      params.require(:task_list).permit(:name, :id)
    end

    def save_in_cookie
      cookies[@task_list.id] = @task_list.friendly_id if @task_list.persisted?
    end

    def destroy_from_cookie
      cookies.delete (@task_list.id) if @task_list.destroyed?
    end

    def list_ids
      a= cookies.select { |x| x[0].to_s.match(/^\d+$/) }
      Hash[a].keys
    end

    def record_not_found
     raise ActionController::RoutingError.new('Not Found')
    end

   def purge_invalid_cookies
     list_ids.each do |x|
       unless TaskList.exists?(id: x)
         cookies.delete(x)
       end
     end
    end
end

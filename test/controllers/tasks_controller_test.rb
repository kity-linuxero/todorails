require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get new" do
    get new_task_list_task_url(@task.task_list_id)
    assert_response :success
  end

  test "should create task" do
      assert_difference('Task.count') do
        post task_list_tasks_url(@task.task_list_id), params: { task: { description: @task.description, end_at: @task.end_at, percentage_of_completion: @task.percentage_of_completion, priority: @task.priority, start_at: @task.start_at, status: @task.status, task_list_id: @task.task_list_id, type: @task.type } }
      end
      assert_redirected_to task_list_url(@task.task_list_id)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { description: @task.description, end_at: @task.end_at, percentage_of_completion: @task.percentage_of_completion, priority: @task.priority, start_at: @task.start_at, status: @task.status, task_list_id: @task.task_list_id, type: @task.type } }
    assert_redirected_to task_list_url(@task.task_list_id)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end
    assert_redirected_to task_list_url(@task.task_list_id)
  end

end

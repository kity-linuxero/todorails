require 'test_helper'

class TaskListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task_list = task_lists(:one)
    I18n.locale=:en
  end

  test "should get index" do
    get task_lists_url(locale: I18n.locale)
    assert_response :success
  end

  test "should get new" do
    get root_url(locale: I18n.locale)
    assert_response :success
  end

  test "should create task_list" do
    assert_difference('TaskList.count') do
      post task_lists_url(locale: I18n.locale), params: { task_list: { name: @task_list.name } }
    end

    assert_redirected_to task_list_url(TaskList.last, locale: I18n.locale)
  end

  test "should show task_list" do
    get task_list_url(@task_list, locale: I18n.locale)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_list_url(@task_list, locale: I18n.locale)
    assert_response :success
  end

  test "should update task_list" do
    patch task_list_url(@task_list, locale: I18n.locale), params: { task_list: { name: @task_list.name } }
    assert_redirected_to task_list_url(@task_list, locale: I18n.locale)
  end

  test "should destroy task_list" do
    assert_difference('TaskList.count', -1) do
      delete task_list_url(@task_list, locale: I18n.locale)
    end

    assert_redirected_to task_lists_url(locale: I18n.locale)
  end
end

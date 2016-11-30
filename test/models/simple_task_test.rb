require 'test_helper'

class SimpleTaskTest < ActiveSupport::TestCase

  # Un estado inválido
  test "an invalid status" do

     simple_task = SimpleTask.new do |s|
       s.description= "Description"
       s.priority= "low"
       s.status= "expired" # Valid status => {pending, done}
     end

     assert_not simple_task.save
    # assert s.destroy
   end

  # Un estado válido
  test "a valid status" do

	simple_task = SimpleTask.new do |s|
       s.description= "Description"
       s.priority= "low"
       s.status= %w(pending done).shuffle.first # Valid status => {pending, done}
       s.task_list_id=1
    end
     assert simple_task.save
     assert s.destroy
  end
end

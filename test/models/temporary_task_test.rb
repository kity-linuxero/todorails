require 'test_helper'

class TemporaryTaskTest < ActiveSupport::TestCase
  
	# Una tarea temporal bien armada 
   test "Correct temporary task" do
	one = TemporaryTask.new do |t|
	  t.description= "A new temporary task"
	  t.created_at = Time.now
	  t.priority= "medium"
	  t.created_at = Time.now
	  t.start_at = Time.now
	  t.end_at = Time.now
	  t.status = %w(done pending expired).shuffle.first
	  
	end
	assert one.save
   end
  
   
  
end

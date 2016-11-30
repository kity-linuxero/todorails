require 'test_helper'

class LongTaskTest < ActiveSupport::TestCase
  
   # Una long task correcta
   test "A correct long task" do
     
     one = LongTask.new do |t|
	  t.description= "A new Long task"
	  t.created_at = Time.now
	  t.priority= "high"
	  t.status= %w(done pending in_progress).shuffle.first
	  t.percentage_of_completion= rand(0..100)
	  
	end
     assert one.save
   end
   
   # Una long task con un porcentaje incorrecto
   test "An incorrect percentage for long task" do
     
     one = LongTask.new do |t|
	  t.description= "A new Long task"
	  t.created_at = Time.now
	  t.priority= "high"
	  t.status= %w(done pending in_progress).shuffle.first
	  t.percentage_of_completion= 101
	  
	end
     assert_not one.save
   end
   
end

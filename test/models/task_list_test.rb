require 'test_helper'

class TaskListTest < ActiveSupport::TestCase
   
   
   
   # Una Task List vacía debe ser inválida
   test "A empty task list must be invalid" do
     tl = TaskList.new
     assert_not  tl.valid?
   end
   
   # Una Task List sin una descripción será inválida
   test "Task without name. Will be invalid" do
     tl = TaskList.new
     tl.created_at= Time.now
     tl.url="url"
     assert_not tl.save
   end
   
   # No se debe permitir una url repetida
   test "No repeat URL"do
   
     one = TaskList.new do |t|
	  t.name = "Task List One"
	  t.created_at = Time.now
	  t.url = "url1"
	 end
	 
	 one.save
	 
	 two = TaskList.new do |t|
	  t.name = "Task List Two"
	  t.created_at = Time.now
	  t.url = "url1"
	 end
	 
	 assert_not two.save
   
   end
   
   # Un caso feliz :)
   test "well done" do
	 one = TaskList.new do |t|
	  t.name = "Task List One"
	  t.created_at = Time.now
	  t.url = "url1"
	 end
	 
	 assert one.save
	 
   end
   
end

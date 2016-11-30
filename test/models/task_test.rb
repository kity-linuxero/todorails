require 'test_helper'

class TaskTest < ActiveSupport::TestCase
   
  # Una tarea bien armada 
   test "Correct task" do
	one = Task.new do |t|
	  t.description= "A new task"
	  t.created_at = Time.now
	  t.priority= %w(low medium high).shuffle.first
	  t.created_at = Time.now
	  
	  
	end
	assert one.save
   end
   
   # Una tarea con una descripción mas larga de lo permitido
   test "A long description must be invalid" do
     one = Task.new do |t|
	  t.description = "a"*256
	  t.created_at = Time.now
	  t.priority = "low"
	  
	 end
	 
	 assert_not one.save
   
   end
   
   # Una tarea con una prioridad inválida
   test "an invalid priority" do
     one = Task.new do |t|
	  t.description= "A new task"
	  t.created_at = Time.now
	  t.priority = "very low"
	  
	 end
	 
	 assert_not one.save
   
   end
end

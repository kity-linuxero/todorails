require 'test_helper'

class TaskListTest < ActiveSupport::TestCase

   # Una Task List vacía debe ser inválida
   test "A empty task list must be invalid" do
     tl = TaskList.new
     assert_not  tl.valid?
   end

   # Sin nombre
   test "Task without name. Will be invalid" do
     tl = TaskList.new
     tl.name= nil
     assert_not tl.save
   end

   # Con nombre que respete la unicidad de los slugs.
   test "slug unicity" do
     one = TaskList.new do |t|
  	  t.name = "Task List One"
  	  t.created_at = Time.now
  	 end
     assert one.save
   end

   # Con nombre que cause un conflicto de unicidad de los slugs.
   test "slug unicity conflict"do
     one = TaskList.new do |t|
  	  t.name = "Task List One=Ño Ñe %6"
  	  t.created_at = Time.now
  	 end
  	 one.save

  	 two = TaskList.new do |t|
  	  t.name = "Task List One=Ño Ñe %6"
  	  t.created_at = Time.now
  	 end
  	 two.save
     assert_not(one.slug == two.slug)
   end

end

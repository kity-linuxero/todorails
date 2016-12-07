require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  # Creación de una nueva tarea sin ningún dato.
  test "Empty task" do
    one= Task.new
    assert_not one.save
  end

  # Una tarea "genérica" sin tipo. Debe fallar.
  test "Generic Task Should be invalid" do
  	one = Task.new do |t|
  	  t.description= "A new generic task"
  	  t.created_at = Time.now
  	  t.priority= %w(low medium high).shuffle.first
  	  t.status = %w(pending done).shuffle.first
  	end
  	assert_not one.save
  end

   # Una tarea con una descripción mas larga de lo permitido
   test "A long description must be invalid" do
    one = SimpleTask.new do |t|
  	  t.description = "a"*256
  	  t.status = "done"
  	  t.priority = "low"
	  end
	  assert_not one.save # Bad !

    one.description= "Short description"
    assert one.save #Good!
   end

   # Una tarea con una prioridad inválida
   test "an invalid priority" do
    one = SimpleTask.new do |t|
  	  t.description= "A new task"
  	  t.status = "pending"
  	  t.priority = "very low"
  	end
	  assert_not one.save # Boom!
    one.priority = "high"
    assert one.save # Good!
   end

   # Una TemporaryTask se pasa a expired explícitamente
   test "A TemporaryTask switch to expired" do
     one = TemporaryTask.new do |t|
       t.description= "A new TemporaryTask"
       t.status= "pending"
       t.priority= "medium"
       t.start_at= Time.now
       t.end_at= 5.minutes.from_now
     end
     assert one.save # Good!
     one.status= "expired"
     assert_not one.save # Boom!
   end

   # Una tarea expirada cambia de fecha de expiración
   test "A TemporaryTask task expired change the end" do
     one = TemporaryTask.new do |t|
       t.description= "New TemporaryTask"
       t.status= "pending"
       t.priority= "high"
       t.start_at= 10.minutes.ago
       t.end_at= 5.minutes.ago
     end
     assert one.save # Good!
     assert (one.status_task == "expired") # Should be "expired"
     one.end_at = 5.minutes.from_now
     assert one.save
     assert (one.status_task =="pending") # Should be "pending"
   end

   # La creación de una tarea temporal con un rango de validez invertido (fecha de inicio mayor a fecha de fin).
   test "Inverted dates must fail" do
     one = TemporaryTask.new do |t|
       t.description= "A new temporary task"
       t.status= "pending"
       t.priority= "low"
       t.end_at= 2.days.ago
       t.start_at= Time.now
     end
     assert_not one.save # Bad!
     one.end_at= 2.days.from_now
     assert one.save # Good!
   end

   # Una LongTask
   test "Percentage of LongTask must be valid" do
     one = LongTask.new do |t|
       t.description= "New Long Task"
       t.status= "pending"
       t.priority= "medium"
     end
    assert_not one.save # Without percentage!
    one.percentage_of_completion= 30
    assert one.save # Good!
    one.percentage_of_completion= 101
    assert_not one.save # Out of range!!!
   end

   # Estado de una LongTask
   test "Status of LongTask the 'in_progress' status not exist." do
     one = LongTask.new do |t|
       t.description= "New Long Task"
       t.status= "pending"
       t.priority= "low"
       t.percentage_of_completion= 0
     end
     assert one.save
     assert (one.status_task == "pending")
     one.percentage_of_completion = 1
     assert (one.status_task == "in progress")
     one.percentage_of_completion = 100
     assert (one.status_task) == "pending" #if percentage if 0 or 100 status don't change!
     one.status= "in progress"
     assert_not one.save #in progress not a valid status for storage
   end

   # Ordenamiento de tareas: De diferentes tipos, con diferentes prioridades.
   test "Order of tasks" do
     # Simple Task with low priority
     one= SimpleTask.new do |t|
        t.description= "one"
        t.status= %w(pending done).shuffle.first
        t.priority= "low"
     end
     # Long Task with low priority
     two= LongTask.new do |t|
      t.description= "two"
      t.status= %w(pending done).shuffle.first
      t.percentage_of_completion= 50
      t.priority= "medium"
   end
   #TemporaryTask
   three= TemporaryTask.new do |t|
     t.description= "three"
     t.status= %w(pending done).shuffle.first
     t.priority= "high"
     t.start_at= Time.now
     t.end_at= 5.minutes.from_now
   end

   assert one.save
   assert two.save
   assert three.save

   sorted_list = Task.all.sort
   assert (sorted_list.first.priority == "high" && sorted_list.first.description == "three")
   assert (sorted_list.second.priority == "medium" && sorted_list.second.description == "two")
   assert (sorted_list.last.priority == "low" && sorted_list.last.description == "one")

   # Change priorities!!
   one.priority= "medium"
   two.priority= "high"
   three.priority= "low"

   one.save
   two.save
   three.save

   new_sorted_list = Task.all.sort
   p new_sorted_list.first
  # assert (new_sorted_list.first.priority == "high" && new_sorted_list.first.description == "two")
   assert (new_sorted_list.second.priority == "medium")# && new_sorted_list.second.description == "one")
   #puts "PRIO== #{new_sorted_list.first.priority} TASK= #{new_sorted_list.second.description}"
   assert (new_sorted_list.last.priority == "low" && new_sorted_list.last.description == "three")

end
end

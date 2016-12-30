require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    # Clean test data base
    Task.all.map {|x| x.destroy}
  end

  # Creación de una nueva tarea sin ningún dato.
  test "An empty task don't should be created" do
    one= Task.new
    assert_not one.save
  end

  # Una tarea "genérica" sin tipo. Debe fallar.
  test "A generic task don't should be created" do
  	one = Task.new do |t|
  	  t.description= "A new generic task"
  	  t.created_at = Time.now
  	  t.priority= %w(low medium high).shuffle.first
  	  t.status = %w(pending done).shuffle.first
  	end
  	assert_not one.save
  end

   # Una tarea con una descripción mas larga de lo permitido
   test "A Task with a long description don't should be created" do
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
   test "A Task with an invalid priority, should be invalid to save" do
    one = SimpleTask.new do |t|
  	  t.description= "A new task"
  	  t.status = "pending"
  	  t.priority = "very low"
  	end
	  assert_not one.save # Boom!
    one.priority = "high"
    assert one.save # Good!
   end

   # Una tarea expirada cambia de fecha de expiración
   test "A TemporaryTask task expired change end_at" do
     one = TemporaryTask.new do |t|
       t.description= "New TemporaryTask"
       t.status= "pending"
       t.priority= "high"
       t.start_at= 10.minutes.ago
       t.end_at= 5.minutes.ago
     end
     assert one.save # Good!
     assert (one.status == "expired") # Should be "expired"
     one.end_at = 5.minutes.from_now
     assert one.save
     assert (one.status =="pending") # Should be "pending"
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
       t.priority= "medium"
     end
    assert_not one.save # Without percentage!
    one.percentage_of_completion= 30
    assert one.save # Good!
    one.percentage_of_completion= 101
    assert_not one.save # Out of range!!!
   end

   # Estado de una LongTask
   test "The percentage of completion determines status" do
     one = LongTask.new do |t|
       t.description= "New Long Task"
       t.priority= "low"
       t.percentage_of_completion= 0
     end
     assert one.save
     assert (one.status == "pending")
     one.percentage_of_completion = 1
     assert (one.status == "in progress")
     one.percentage_of_completion = 100
     assert (one.status == "done")
   end

   # Ordenamiento de tareas: De diferentes tipos, con diferentes prioridades.
   test "Order of tasks" do
     # Simple Task with low priority
     t1= SimpleTask.new do |t|
        t.description= "one"
        t.status= %w(pending done).shuffle.first
        t.priority= "low"
     end

     # Long Task with low priority
     t2= LongTask.new do |t|
      t.description= "two"
      t.status= %w(pending done).shuffle.first
      t.percentage_of_completion= 50
      t.priority= "medium"
     end

   #TemporaryTask
   t3= TemporaryTask.new do |t|
     t.description= "three"
     t.status= %w(pending done).shuffle.first
     t.priority= "high"
     t.start_at= Time.now
     t.end_at= 5.minutes.from_now
   end

   assert t1.save
   assert t2.save
   assert t3.save

   sorted_list = Task.all.sort
   # First place
   assert (sorted_list.first.priority == "high" && sorted_list.first.description == "three")
   # Second place
   assert (sorted_list.second.priority == "medium" && sorted_list.second.description == "two")
   # Third place
   assert (sorted_list.third.priority == "low" && sorted_list.third.description == "one")

   # Change priorities!!
   t1.priority= "medium"
   t2.priority= "high"
   t3.priority= "low"

   assert t1.save
   assert t2.save
   assert t3.save

   new_sorted_list = Task.all.sort
   # First place
   assert (new_sorted_list.first.priority == "high" && new_sorted_list.first == t2)
   # Second place
   assert (new_sorted_list.second.priority == "medium" && new_sorted_list.second == t1)
   # Third place
   assert (new_sorted_list.third.priority == "low" && new_sorted_list.third == t3)

 end
end

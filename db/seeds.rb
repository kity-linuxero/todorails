# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TaskList.create! [
{ name: 'Lista 0' },
{ name: 'Lista 1' },
]

Task.create! [
{
  description: 'Pasear al perro',
  type: 'SimpleTask',
  status: 'pending',
  priority: 'medium',
  task_list: TaskList.find_by(name: 'Lista 0')
},

{
  description: 'Ordenar la pieza',
  type: 'SimpleTask',
  status: 'done',
  priority: 'low',
  task_list: TaskList.find_by(name: 'Lista 0')
},

{
  description: 'Preparar parcial Ruby',
  type: 'TemporaryTask',
  status: 'pending',
  priority: 'high',
  start_at: Time.now,
  end_at: 2.weeks.from_now,
  task_list: TaskList.find_by(name: 'Lista 0')
},

{
  description: 'Asistir a conferencia de Software Libre',
  type: 'TemporaryTask',
  status: 'done',
  priority: 'medium',
  start_at: 1.week.ago,
  end_at: 6.days.ago,
  task_list: TaskList.find_by(name: 'Lista 0')
},

{
  description: 'Trabajo final Ruby',
  type: 'LongTask',
  status: 'pending',
  priority: 'high',
  percentage_of_completion: '90',
  task_list: TaskList.find_by(name: 'Lista 0')
},

{
  description: 'Arreglar la bicicleta',
  type: 'LongTask',
  status: 'done',
  priority: 'low',
  percentage_of_completion: '100',
  task_list: TaskList.find_by(name: 'Lista 0')
},
]

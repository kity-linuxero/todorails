class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :task_list, foreign_key: true
      t.string :description, limit: 255
      t.string :status
      t.string :priority
      t.integer :percentage_of_completion
      t.string :type
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end

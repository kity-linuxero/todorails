class ChangeUrlFromTaskList < ActiveRecord::Migration[5.0]
  def change
    change_column :task_lists, :url, :string, unique: true
  end
end

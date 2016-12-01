class RemoveUrlFromTaskLists < ActiveRecord::Migration[5.0]
  def change
    remove_column :task_lists, :url, :string
  end
end

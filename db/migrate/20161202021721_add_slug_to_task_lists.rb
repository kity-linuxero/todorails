class AddSlugToTaskLists < ActiveRecord::Migration[5.0]
  def change
    add_column :task_lists, :slug, :string
    add_index :task_lists, :slug
  end
end

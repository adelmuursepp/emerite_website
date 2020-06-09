class AddWrittenTaskToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :resource_items, :written_task, :text
  end
end

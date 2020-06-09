class AddCodingtaskToResourceItem < ActiveRecord::Migration[6.0]
  def change
    add_column :resource_items, :cdong_task, :string
  end
end

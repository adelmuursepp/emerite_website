class AddStatusToResourceItem < ActiveRecord::Migration[6.0]
  def change
    add_column :resource_items, :status, :integer, default: 0
  end
end

class AddIntroToResourceItem < ActiveRecord::Migration[6.0]
  def change
    add_column :resource_items, :intro, :text
  end
end

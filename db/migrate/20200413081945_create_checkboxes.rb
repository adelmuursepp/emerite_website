class CreateCheckboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :checkboxes do |t|
      t.text :label
      t.integer :checked
      t.references :user, foreign_key: true
      t.references :resource_item, foreign_key: true

      t.timestamps

    end
  end
end

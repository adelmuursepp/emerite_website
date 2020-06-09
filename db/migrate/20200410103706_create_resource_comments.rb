class CreateResourceComments < ActiveRecord::Migration[6.0]
  def change
    create_table :resource_comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :resource_item, foreign_key: true

      t.timestamps
    end
  end
end

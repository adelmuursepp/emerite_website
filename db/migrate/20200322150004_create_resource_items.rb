class CreateResourceItems < ActiveRecord::Migration[6.0]
  def change
    create_table :resource_items do |t|
      t.string :title
      t.string :url
      t.text :body
      t.references :resource_topic, foreign_key: true

      t.timestamps
    end
  end
end

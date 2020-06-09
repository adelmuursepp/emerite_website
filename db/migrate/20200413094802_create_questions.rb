class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.text :option1
      t.text :option2
      t.text :option3
      t.text :explanation1
      t.text :explanation2
      t.text :explanation3
      t.references :resource_item, foreign_key: true

      t.timestamps
    end
  end
end

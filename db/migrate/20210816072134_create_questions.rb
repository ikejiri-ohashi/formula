class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :url,            null: false
      t.string :time,           null: false
      t.string :text,           null: false
      t.integer :category_id,   null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :url,      null: false
      t.integer :time,    null: false
      t.text :text,       null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :role, null: false, foreign_key: true
      t.references :mapping, null: false, foreign_key: true
      t.string :question 
      t.integer :priority
      t.string :teaming_stages
      t.integer :appears
      t.integer :frequency
      t.string :type
      t.string :conditions
      t.string :required
      t.timestamps
    end
  end
end

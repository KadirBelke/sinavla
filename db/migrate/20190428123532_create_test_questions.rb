class CreateTestQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :test_questions do |t|
      t.text :question
      t.string :true_answer
      t.string :wrong
      t.string :wrong2
      t.string :wrong3
      t.string :wrong4
      t.integer :kind
      t.integer :difficulty

      t.timestamps
    end
  end
end

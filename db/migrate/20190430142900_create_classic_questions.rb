class CreateClassicQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :classic_questions do |t|
      t.string :question
      t.string :true_answer
      t.integer :kind
      t.integer :difficulty

      t.timestamps
    end
  end
end

class AddUserToTestQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_questions, :user, foreign_key: true
  end
end

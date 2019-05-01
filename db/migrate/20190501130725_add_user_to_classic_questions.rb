class AddUserToClassicQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :classic_questions, :user, foreign_key: true
  end
end

class AddLessonToTestQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :test_questions, :lesson, foreign_key: true
  end
end

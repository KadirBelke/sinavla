class AddLessonToClassicQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :classic_questions, :lesson, foreign_key: true
  end
end

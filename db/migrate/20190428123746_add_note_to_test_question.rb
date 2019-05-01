class AddNoteToTestQuestion < ActiveRecord::Migration[5.1]
  def change
    add_column :test_questions, :note, :string
  end
end

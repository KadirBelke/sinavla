class CreatePreparedExams < ActiveRecord::Migration[5.2]
  def change
    create_table :prepared_exams do |t|
      t.string :test
      t.string :classic

      t.timestamps
    end
  end
end

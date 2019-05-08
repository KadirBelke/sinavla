class AddQuestionCountToPreparedExams < ActiveRecord::Migration[5.2]
  def change
    add_column :prepared_exams, :test_kolay_soru_sayisi, :integer
    add_column :prepared_exams, :test_orta_soru_sayisi, :integer
    add_column :prepared_exams, :test_zor_soru_sayisi, :integer
    add_column :prepared_exams, :klasik_kolay_soru_sayisi, :integer
    add_column :prepared_exams, :klasik_orta_soru_sayisi, :integer
    add_column :prepared_exams, :klasik_zor_soru_sayisi, :integer
  end
end

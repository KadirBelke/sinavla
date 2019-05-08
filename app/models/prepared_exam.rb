class PreparedExam < ApplicationRecord
  serialize :test, Array
  serialize :classic, Array


  validates :test_kolay_soru_sayisi, numericality: { greater_than_or_equal_to: 0 }
  validates :test_orta_soru_sayisi, numericality: { greater_than_or_equal_to: 0 }
  validates :test_zor_soru_sayisi, numericality: { greater_than_or_equal_to: 0 }

  validates :klasik_kolay_soru_sayisi, numericality: { greater_than_or_equal_to: 0 }
  validates :klasik_orta_soru_sayisi, numericality: { greater_than_or_equal_to: 0 }
  validates :klasik_zor_soru_sayisi, numericality: { greater_than_or_equal_to: 0 }
end

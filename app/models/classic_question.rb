class ClassicQuestion < ApplicationRecord
  enum kind: [:vize, :final, :but]
  enum difficulty: [:kolay, :orta, :zor]

  belongs_to :lesson
  belongs_to :user

  has_one_attached :image
end

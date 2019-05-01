class Lesson < ApplicationRecord
  has_many :test_questions
  has_many :classic_questions
end

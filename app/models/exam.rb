class Exam < ApplicationRecord
  has_many :subjects
  validates :name, presence: true
end

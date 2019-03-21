class Subject < ApplicationRecord
  has_many :topics
  belongs_to :exam
  validates :name, presence: true
end

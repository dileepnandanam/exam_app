class Question < ApplicationRecord
  belongs_to :chapter
  has_many :options
end

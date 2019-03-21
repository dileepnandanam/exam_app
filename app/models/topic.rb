class Topic < ApplicationRecord
  belongs_to :subject
  has_many :chapters
  validates :name, presence: true
end

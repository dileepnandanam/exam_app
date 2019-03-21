class Answer < ApplicationRecord
  has_many :choices
  belongs_to :question
  belongs_to :user
end

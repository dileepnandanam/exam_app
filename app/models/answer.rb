class Answer < ApplicationRecord
  belongs_to :option, optional: true
  belongs_to :question
  belongs_to :user

  validates :option_id, presence: true, if: -> {skipped == false}
end

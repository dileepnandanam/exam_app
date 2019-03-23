require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test 'cant create answer without option and with skipped as false' do
    answer = Answer.new(skipped: false, user: users(:one), question: questions(:one))
    assert_not answer.save
  end
end

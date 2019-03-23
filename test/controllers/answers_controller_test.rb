require 'test_helper'

class ExamsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in users(:one)
  end

  test 'should post answer' do
    params = {
      answer: {
        question_id: questions(:one).id,
        option_id: options(:one).id
      }
    }
    post answers_path, params: params
    assert_response :success
    assert_equal Answer.count, 1
  end

  test 'should not create answer if already answered' do
    answer = Answer.create(user: users(:one), question: questions(:one), option: options(:one))
    params = {
      answer: {
        question_id: questions(:one).id,
        option_id: options(:one).id
      }
    }
    post answers_path, params: params
    assert_response 422
    assert_equal Answer.count, 1
  end
end
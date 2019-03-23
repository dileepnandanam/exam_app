require 'test_helper'

class ExamsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    sign_in users(:one)
  end
  
  test "progress should generate correct values for exam" do
    exam = exams(:one)
    Answer.create(question: questions(:one), user: users(:one), option: options(:one))
    get progress_exams_path(item_type: 'exam', item_id: exam.id)
    assert_equal controller.instance_variable_get(:@unseen_questions), 50
    assert_equal controller.instance_variable_get(:@skipped_questions), 0
    assert_equal controller.instance_variable_get(:@correct_answers), 0
    assert_equal controller.instance_variable_get(:@wrong_answers), 50
    assert_response :success
  end

  test "progress should generate correct values for subject" do
    subject = subjects(:one)
    Answer.create(question: questions(:one), user: users(:one), option: options(:correct))
    get progress_exams_path(item_type: 'subject', item_id: subject.id)
    assert_equal controller.instance_variable_get(:@unseen_questions), 50
    assert_equal controller.instance_variable_get(:@skipped_questions), 0
    assert_equal controller.instance_variable_get(:@correct_answers), 50
    assert_equal controller.instance_variable_get(:@wrong_answers), 0
    assert_response :success
  end

  test "progress should generate correct values for topic" do
    topic = topics(:one)
    Answer.create(question: questions(:one), user: users(:one), skipped: true)
    get progress_exams_path(item_type: 'topic', item_id: topic.id)
    assert_equal controller.instance_variable_get(:@unseen_questions), 50
    assert_equal controller.instance_variable_get(:@skipped_questions), 50
    assert_equal controller.instance_variable_get(:@correct_answers), 0
    assert_equal controller.instance_variable_get(:@wrong_answers), 0
    assert_response :success
  end

  test "progress should generate correct values for chapter" do
    chapter = chapters(:one)
    Answer.create(question: questions(:one), user: users(:one), skipped: true)
    get progress_exams_path(item_type: 'chapter', item_id: chapter.id)
    assert_equal controller.instance_variable_get(:@unseen_questions), 50
    assert_equal controller.instance_variable_get(:@skipped_questions), 50
    assert_equal controller.instance_variable_get(:@correct_answers), 0
    assert_equal controller.instance_variable_get(:@wrong_answers), 0
    assert_response :success
  end

  test "random_questions should list questions under exam" do
    exam = exams(:one)
    get random_questions_exams_path(item_type: 'exam', item_id: exam.id)
    assert controller.instance_variable_get(:@questions).include?(questions(:one))
  end

  test "random_questions should list questions under subject" do
    subject = subjects(:one)
    get random_questions_exams_path(item_type: 'subject', item_id: subject.id)
    assert controller.instance_variable_get(:@questions).include?(questions(:one))
  end

  test "random_questions should list questions under topic" do
    topic = topics(:one)
    get random_questions_exams_path(item_type: 'topic', item_id: topic.id)
    assert controller.instance_variable_get(:@questions).include?(questions(:one))
  end

  test "random_questions should list questions under chapter" do
    chapter = chapters(:one)
    get random_questions_exams_path(item_type: 'chapter', item_id: chapter.id)
    assert controller.instance_variable_get(:@questions).include?(questions(:one))
  end

  test "random_questions should list skipped questions under exam" do
    exam = exams(:one)
    Answer.create(question: questions(:one), user: users(:one), skipped: true)
    Answer.create(question: questions(:two), user: users(:one), skipped: true)
    get random_questions_exams_path(item_type: 'exam', item_id: exam.id)
    assert controller.instance_variable_get(:@questions).include?(questions(:one))
  end
end
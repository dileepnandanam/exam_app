class QuestionsController < ApplicationController
  before_action :find_parents
  after_action -> {mark_as_viewed(@questions)}, only: [:index]
  def index
    @questions = @chapter.questions.unanswered_or_skipped_by(current_user)
    mark_as_viewed(@questions)
    render 'index', layout: false
  end
  
  protected
  def find_parents
    @chapter = Chapter.find(params[:chapter_id])
    @topic = @chapter.topic
    @subject = @topic.subject
    @exam = @subject.exam
  end

  def without_answered(questions)

  end
end

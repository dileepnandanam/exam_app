class QuestionsController < ApplicationController
  before_action :find_parents
  def index
    @questions = without_answered(@chapter.questions)
    render 'index', layout: false
  end
  
  protected
  def find_parents
    @chapter = Chapter.find(params[:chapter_id])
    @topic = @chapter.topic
    @subject = @topic.subject
    @exam = @subject.exam
  end
end

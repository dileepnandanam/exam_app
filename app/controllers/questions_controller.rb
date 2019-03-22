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

  def without_answered(questions)
    questions.joins('left join answers on questions.id = answers.question_id')
      .where('answers.user_id = ? and answers.skipped = ? or answers.id is ?', current_user.id, true, nil)
  end
end

class TopicsController < ApplicationController
  before_action :find_parents
  def index
    @topics = @subject.topics
    render 'index', layout: false
  end

  protected
  def find_parents
    @subject = Subject.find(params[:subject_id])
    @exam = @subject.exam
  end
end

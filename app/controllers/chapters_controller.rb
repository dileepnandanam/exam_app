class ChaptersController < ApplicationController
  before_action :find_parents
  def index
    @chapters = @topic.chapters
    render 'index', layout: false
  end

  def find_parents
    @topic = Topic.find(params[:topic_id])
    @subject = @topic.subject
    @exam = @subject.exam
  end
end

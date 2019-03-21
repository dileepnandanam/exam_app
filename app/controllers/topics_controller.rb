class TopicsController < ApplicationController
  before_action :find_parents
  def index
    @topics = @subject.topics
  end

  def find_parents
    @subject = Subject.find(params[:subject_id])
  end
end

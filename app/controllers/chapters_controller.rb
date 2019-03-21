class ChaptersController < ApplicationController
  before_action :find_parents
  def index
    @chapters = @topic.chapters
  end

  def find_parents
    @topic = Topic.find(params[:topic_id])
  end
end

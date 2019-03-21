class questionsController < ApplicationController
  before_action :find_parents
  def index
    @questions = @chapter.questions
  end

  def find_parents
    @chapter = Chapter.find(params[:chapter_id])
  end
end

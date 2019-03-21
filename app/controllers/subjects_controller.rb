class SubjectsController < ApplicationController
  before_action :find_parents
  def index
    @subjects = @exam.subjects
    render 'index', layout: false
  end

  protected
  def find_parents
    @exam = Exam.find(params[:exam_id])
  end
end

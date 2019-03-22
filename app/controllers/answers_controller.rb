class AnswersController < ApplicationController
  def create
    answer_params = params.require(:answer).permit(:option_id, :question_id)
    @answer = Answer.new(answer_params.merge(user_id: current_user.id))
    if @answer.save
      delete_skip_response(answer_params[:question_id])
      render 'create', layout: false
    else
      @questions = [Question.find(answer_params[:question_id])]
      render 'questions/index', layout: false, status: 422
    end
  end

  def skip
    answer_params = params.permit(:question_id)
    Answer.create(answer_params.merge({
      user_id: current_user.id,
      skipped: true
    }))
    render 'skip', layout: false
  end

  protected
  def delete_skip_response(question_id)
    Answer.where(user_id: current_user.id, question_id: question_id, skipped: true).first.try(:delete)
  end
end
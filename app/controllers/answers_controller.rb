class AnswersController < ApplicationController
  def create
    answer_params = params.require(:answer).permit(:option_id, :question_id)
    @answer = Answer.new(answer_params.merge(user_id: current_user.id))
    if Answer.where(question_id: answer_params[:question_id], user_id: current_user.id, skipped: false).first.present?
      render head: :ok, status: 422
    elsif @answer.save
      delete_skip_response(answer_params[:question_id])
      render 'create', layout: false
    else
      @questions = [Question.find(answer_params[:question_id])]
      render 'questions/index', layout: false, status: 422
    end
  end

  def skip
    answer_params = params.permit(:question_id)
    Answer.where(answer_params.merge({
      user_id: current_user.id,
      skipped: true
    })).first_or_initialize.save
    render 'skip', layout: false
  end

  protected
  def delete_skip_response(question_id)
    Answer.where(user_id: current_user.id, question_id: question_id, skipped: true).first.try(:delete)
  end
end
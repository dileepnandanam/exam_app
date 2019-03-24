class ExamsController < ApplicationController
  after_action -> {mark_as_viewed(@questions)}, only: [:random_questions]
  def index
    @exams = Exam.all
  end

  def random_questions
    @questions = Question.under(params[:item_type], params[:item_id])
      .unanswered_by(current_user)
      .all.sample(3)
    if @questions.length == 0
      @questions = Question.under(params[:item_type], params[:item_id])
        .skipped_by(current_user)
        .all.sample(3)
    end
    render 'questions/index', layout: false
  end

  def progress
    @total_questions = Question.under(params[:item_type], params[:item_id]).count
    @unseen_questions = Question.under(params[:item_type], params[:item_id])
      .not_seen_by(current_user).count.to_f * 100 / @total_questions
    @skipped_questions = Question.under(params[:item_type], params[:item_id])
      .skipped_by(current_user).count.to_f * 100 / @total_questions
    @correct_answers = Question.under(params[:item_type], params[:item_id])
      .answered_correctly_by(current_user).to_f * 100 / @total_questions
    @wrong_answers = Question.under(params[:item_type], params[:item_id])
      .answered_wrongly_by(current_user).to_f * 100 / @total_questions
    render 'progress', layout: false
  end

end

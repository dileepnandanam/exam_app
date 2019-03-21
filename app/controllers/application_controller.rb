class ApplicationController < ActionController::Base
  def without_answered(questions)
    questions.joins('left join answers on questions.id = answers.question_id')
      .where('answers.user_id = ? and answers.skipped = ? or answers.id is ?', current_user.id, true, nil)
  end
end

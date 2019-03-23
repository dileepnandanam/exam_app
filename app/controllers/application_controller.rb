class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def mark_as_viewed(questions)
  	questions.each do |question|
      View.where(question: question, user: current_user).first_or_create
  	end
  end
end

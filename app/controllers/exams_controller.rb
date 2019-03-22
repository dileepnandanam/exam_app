class ExamsController < ApplicationController
  def index
    @exams = Exam.all
  end

  def random_questions
    @questions = questions_scop
      .joins("left join answers on questions.id = answers.question_id and answers.user_id = #{current_user.id}")
      .where('answers.id is NULL')
      .all.sample(3)
    if @questions.length == 0
      @questions = questions_scop
        .joins("inner join answers on questions.id = answers.question_id and answers.user_id = #{current_user.id}")
        .where(answers: {skipped: true})
        .all.sample(3)
    end
    render 'questions/index', layout: false
  end

  def progress
    @total_questions = questions_scop.count
    @unseen_questions = questions_scop
      .joins("left join answers on questions.id = answers.question_id and answers.user_id = #{current_user.id}")
      .where('answers.id is NULL').count.to_f * 100 / @total_questions
    @skipped_questions = questions_scop
      .joins("inner join answers on questions.id = answers.question_id and answers.user_id = #{current_user.id}")
      .where(answers: {skipped: true}).count.to_f * 100 / @total_questions
    @correct_answers = questions_scop
      .joins("inner join answers on questions.id = answers.question_id and answers.user_id = #{current_user.id}")
      .joins('inner join options on questions.id = options.question_id and answers.option_id = options.id')
      .where(options: {correct: true}).count('distinct(questions.id)').to_f * 100 / @total_questions
    @wrong_answers = questions_scop
      .joins("inner join answers on questions.id = answers.question_id and answers.user_id = #{current_user.id}")
      .joins('inner join options on questions.id = options.question_id and answers.option_id = options.id')
      .where(options: {correct: false}).count('distinct(questions.id)').to_f * 100 / @total_questions
    render 'progress', layout: false
  end

  protected
  def questions_scop
    id = params[:item_id]
    join_range = ['chapter', 'topic', 'subject', 'exam'].index(params[:item_type])
    join_statements = [
      'inner join chapters on chapters.id = questions.chapter_id',
      'inner join topics on topics.id = chapters.topic_id',
      'inner join subjects on subjects.id = topics.subject_id',
      'inner join exams on exams.id = subjects.exam_id'
    ]
    where_statements = [
      {chapters:{id: id}},
      {topics:{id: id}},
      {subjects:{id: id}},
      {exams:{id: id}}
    ]

    scope = Question
    join_statements[0..join_range].each do |stmt|
      scope = scope.joins(stmt)
    end
    scope = scope.where(where_statements[join_range])
    scope
  end
end

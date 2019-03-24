class Question < ApplicationRecord
  belongs_to :chapter
  has_many :options
  has_many :answers
  validates :name, presence: true

  scope :not_seen_by, -> (user) {
    joins("left join views on questions.id = views.question_id and views.user_id = #{user.id}")
    .where('views.id is NULL')
  }

  scope :skipped_by, -> (user) {
    joins("inner join answers on questions.id = answers.question_id and answers.user_id = #{user.id}")
    .where(answers: {skipped: true})
  }

  scope :answered_correctly_by, -> (user) {
    joins("inner join answers on questions.id = answers.question_id and answers.user_id = #{user.id}")
    .joins('inner join options on questions.id = options.question_id and answers.option_id = options.id')
    .where(options: {correct: true}).count('distinct(questions.id)')
  }

  scope :answered_wrongly_by, -> (user) {
    joins("inner join answers on questions.id = answers.question_id and answers.user_id = #{user.id}")
    .joins('inner join options on questions.id = options.question_id and answers.option_id = options.id')
    .where(options: {correct: false}).count('distinct(questions.id)')
  }

  scope :unanswered_by, -> (user) {
    joins("left join answers on questions.id = answers.question_id and answers.user_id = #{user.id}")
    .where('answers.id is NULL')
  }

  scope :skipped_by, -> (user) {
    joins("inner join answers on questions.id = answers.question_id and answers.user_id = #{user.id}")
    .where(answers: {skipped: true})
  }

  scope :unanswered_or_skipped_by, -> (user) {
    joins('left join answers on questions.id = answers.question_id')
    .where('answers.user_id = ? and answers.skipped = ? or answers.id is ?', user.id, true, nil)
  }

  def self.under(item_type, id)
    join_range = ['chapter', 'topic', 'subject', 'exam'].index(item_type)
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

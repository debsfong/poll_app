class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  belongs_to :poll,
    class_name: :Poll,
    foreign_key: :poll_id,
    primary_key: :id

  has_many :answer_choices,
    class_name: :AnswerChoice,
    foreign_key: :question_id,
    primary_key: :id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def results
    result = Question.select("answer_choices.text, COUNT(*)")
      .joins(:answer_choices)
      .where("question_id = ?", self.id)
      .group("answer_choices.id")

    
  end

end

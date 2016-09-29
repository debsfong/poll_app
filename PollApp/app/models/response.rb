class Response < ActiveRecord::Base
   validate :not_duplicate_response, :author_answer?

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    foreign_key: :answer_id,
    primary_key: :id

  belongs_to :respondent,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question

  def author_answer?
    if self.question.poll.author_id == self.user_id
      errors[:user_id] << "Rigging poll!! Cheater!"
    end
  end

  def sibling_responses
    self.question.responses
  end

  def respondent_already_answered?
    self.sibling_responses.find_by_user_id(self.user_id)
  end

  private
  def not_duplicate_response
    if respondent_already_answered?
      errors[:user_id] << "already answered"
    end
  end
end

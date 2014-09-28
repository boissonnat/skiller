class Question < ActiveRecord::Base

  include PublicActivity::Model

  belongs_to :application_area
  has_many :quiz_questions
  has_and_belongs_to_many :organizations
  belongs_to :user

  validates :title, :presence => true
  validates :right_answer, :presence => true

  scope :is_public, -> { where(is_private: false) }
  scope :is_private, -> { where(is_private: true) }

  def get_answer_rate
    rate = self.quiz_questions.is_correct.size
    if rate > 0
      return (rate * 100) / self.quiz_questions.size
    end
    rate
  end

end

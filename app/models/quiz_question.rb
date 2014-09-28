class QuizQuestion < ActiveRecord::Base

  belongs_to :quiz
  belongs_to :question

  scope :is_correct, -> { where(is_correct: true) }

end

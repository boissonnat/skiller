class Quiz < ActiveRecord::Base

  STATUS_PENDING = 'Pending'
  STATUS_STARTED = 'Started'
  STATUS_FINISHED = 'Finished'


  validates :candidate_email, :presence => true

  has_and_belongs_to_many :application_areas
  has_many :quiz_questions

  before_create :generate_key
  after_create :generate_quiz_questions

  private
  def generate_key
    self.key = SecureRandom.base64(10)
  end

  def generate_quiz_questions
    self.application_areas.each do |application_area|
      application_area.questions.each do |question|
        self.quiz_questions << QuizQuestion.create(quiz: self, question: question)
      end
    end
  end
end

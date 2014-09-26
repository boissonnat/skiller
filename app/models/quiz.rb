class Quiz < ActiveRecord::Base
  extend FriendlyId
  friendly_id :key, use: :slugged

  STATUS_PENDING = 'Pending'
  STATUS_STARTED = 'Started'
  STATUS_FINISHED = 'Finished'

  has_and_belongs_to_many :application_areas
  has_many :quiz_questions
  belongs_to :organization
  belongs_to :candidate
  attr_accessor :new_candidate_email

  accepts_nested_attributes_for :quiz_questions, allow_destroy: true

  before_create :generate_key
  after_create :generate_quiz_questions
  before_save :create_candidate_from_email

  def note_on_twenty
    unless quiz_questions.empty?
      (note * 20) / quiz_questions.size
    else
      0
    end

  end

  private
  def generate_key
    self.key = SecureRandom.base64(10)
  end

  def generate_quiz_questions
    self.application_areas.each do |application_area|
      application_area.questions.each do |question|
        if question.organizations.include? self.organization
          self.quiz_questions << QuizQuestion.create(quiz: self, question: question)
        end
      end
    end
  end

  def create_candidate_from_email
    if self.organization.candidates.find_by(:email => new_candidate_email)
      self.candidate = Candidate.find_by(:email => new_candidate_email)
    else
      create_candidate(:email => new_candidate_email, :organization => self.organization) unless new_candidate_email.blank?
    end

  end
end

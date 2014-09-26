class Question < ActiveRecord::Base

  belongs_to :application_area
  has_many :quiz_questions
  has_and_belongs_to_many :organizations
  belongs_to :user

  validates :statement, :presence => true
  validates :right_answer, :presence => true

  scope :is_public, -> { where(is_private: false) }
  scope :is_private, -> { where(is_private: true) }

end

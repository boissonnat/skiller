class Candidate < ActiveRecord::Base

  validates :email, uniqueness: true

  belongs_to :organization
  has_many :quizzes
end

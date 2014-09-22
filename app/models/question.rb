class Question < ActiveRecord::Base

  belongs_to :application_area
  has_many :quiz_questions

  validates :statement, :presence => true, length: { maximum: 500 }
  validates :right_answer, :presence => true, length: { maximum: 500 }

end

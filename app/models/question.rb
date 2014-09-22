class Question < ActiveRecord::Base

  belongs_to :application_area

  validates :statement, :presence => true, length: { maximum: 500 }
  validates :right_answer, :presence => true, length: { maximum: 500 }

end

class ApplicationArea < ActiveRecord::Base

  has_and_belongs_to_many :quizzes
  has_many :questions

end

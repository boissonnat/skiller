class Candidate < ActiveRecord::Base

  validates :email, uniqueness: true

  belongs_to :organization
  has_many :quizzes


  def average_note
    unless self.quizzes.empty?
      note = 0
      self.quizzes.each do |quiz|
        note += quiz.note_on_twenty
      end
      unless note==0
        note / self.quizzes.size
      end
      note
    else
      0
    end


  end
end

class Quiz < ActiveRecord::Base

  has_and_belongs_to_many :application_areas

  before_create :generate_key

  private
  def generate_key
    self.key = SecureRandom.base64(10)
  end
end

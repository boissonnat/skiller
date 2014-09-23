class Organization < ActiveRecord::Base

  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_and_belongs_to_many :questions
  has_many :users
end

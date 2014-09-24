class Organization < ActiveRecord::Base

  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_and_belongs_to_many :questions
  has_many :users

  before_save :set_organization_admin

  def get_admin
    self.users.each do |user|
      if user.role?(Role::ORGANIZATION_ADMIN)
        return user
      end
    end
  end

  private
  def set_organization_admin
    current_user = self.users.first!
    current_user.roles = [Role.find_by(name: Role::ORGANIZATION_ADMIN), Role.find_by(name: Role::DEFAULT)]
    current_user.save
  end
end

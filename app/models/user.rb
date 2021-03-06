#encoding: utf-8
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_many :questions
  belongs_to :organization

  before_create :set_default_role

  def role?(role)
    !!self.roles.find_by_name(role)
  end

  private
  def set_default_role
    self.roles << Role.find_by!(name: Role::DEFAULT)
  end

end

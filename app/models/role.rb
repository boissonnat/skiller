#encoding: utf-8
class Role < ActiveRecord::Base

  DEFAULT = 'default'
  ORGANIZATION_ADMIN = 'organization_admin'
  ADMIN = 'admin'

  has_and_belongs_to_many :users
end

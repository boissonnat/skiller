require 'faker'

FactoryGirl.define do
  factory :default_role, class: Role do |f|
    f.name Role::DEFAULT
  end
end

FactoryGirl.define do
  factory :organization_admin_role, class: Role do |f|
    f.name Role::ORGANIZATION_ADMIN
  end
end
require 'faker'

FactoryGirl.define do
  factory :default_user, class: User do |f|
    f.email     { Faker::Internet.email }
    f.password  { Faker::Internet.password(8) }
  end

  factory :admin_user, class: User do |f|
    f.email     { Faker::Internet.email }
    f.password  { Faker::Internet.password(8) }
    f.roles     { [ FactoryGirl.create(:organization_admin_role) ] }
  end
end
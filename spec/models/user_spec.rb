require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:default_user)).to be_valid
  end

  it 'does not allow duplicate email per user' do
    FactoryGirl.create(:default_user, email:'wontwork@ceq.fr')
    expect(FactoryGirl.build(:default_user, email:'wontwork@ceq.fr')).not_to be_valid
  end

  it 'is invalid without an email' do
    expect(FactoryGirl.build(:default_user, email: nil)).not_to be_valid
  end

  it 'is invalid without a password' do
    expect(FactoryGirl.build(:default_user, password: nil)).not_to be_valid
  end

  it 'has the default [default] role' do
    user = FactoryGirl.create(:default_user)
    expect(user.role? 'default').to be true
  end

end

require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user, username: Faker::Internet.user_name(10), email: Faker::Internet.email)
  end
  it {is_expected.to validate_presence_of(:username)}
  it {is_expected.to validate_uniqueness_of(:username)}
  it {is_expected.to validate_length_of(:username).is_at_least(4)}
  it {is_expected.to validate_presence_of(:email)}
  it {is_expected.to have_secure_password}
  it {is_expected.to validate_presence_of(:password)}
  it {is_expected.to validate_length_of(:password).is_at_least(6)}
  it {is_expected.to validate_confirmation_of(:password)}
  it {is_expected.to have_many(:questions)}
  it {is_expected.to have_many(:answers)}
  it {is_expected.to have_many(:comments)}
  it {is_expected.to have_many(:votes)}
end

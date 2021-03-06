require 'rails_helper'

RSpec.describe Vote, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user, username: Faker::Internet.user_name(10), email: Faker::Internet.email)
  end
  it "has a valid factory" do
    expect(FactoryGirl.create(:vote, user: @user)).to be_valid
  end
  it {is_expected.to validate_presence_of(:user)}
  it {is_expected.to validate_presence_of(:votable)}
  it {is_expected.to belong_to(:user)}
  it {is_expected.to belong_to(:votable)}
end

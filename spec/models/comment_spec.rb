require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user, username: Faker::Internet.user_name(10), email: Faker::Internet.email)
  end
  it "has a valid factory" do
    expect(FactoryGirl.create(:comment, commentor: @user)).to be_valid
  end
  it {is_expected.to validate_presence_of(:commentor)}
  it {is_expected.to validate_presence_of(:content)}
  it {is_expected.to validate_presence_of(:commentable)}
  it {is_expected.to validate_length_of(:content).is_at_least(10)}
  it {is_expected.to belong_to(:commentor)}
  it {is_expected.to belong_to(:commentable)}
end

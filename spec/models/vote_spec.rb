require 'rails_helper'

RSpec.describe Vote, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:vote)).to be_valid
  end
  it {is_expected.to validate_presence_of(:user)}
  it {is_expected.to validate_presence_of(:votable)}
  it {is_expected.to belong_to(:user)}
  it {is_expected.to belong_to(:votable)}
end

require 'rails_helper'

RSpec.describe Question, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:question)).to be_valid
  end
  it {is_expected.to validate_presence_of(:content)}
  it {is_expected.to validate_presence_of(:title)}
  it {is_expected.to validate_presence_of(:author)}
  it {is_expected.to validate_length_of(:content).is_at_least(10)}
  it {is_expected.to belong_to(:author)}
  it {is_expected.to have_many(:answers)}
  it {is_expected.to have_many(:comments)}
  it {is_expected.to have_many(:votes)}
end

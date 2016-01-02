require 'rails_helper'

RSpec.describe Answer, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user, username: Faker::Lorem.characters(10))
    @answer = FactoryGirl.create(:answer, author: @user)
  end
  it "has a valid factory" do
    expect(@answer).to be_valid
  end
  it {is_expected.to validate_presence_of(:question)}
  it {is_expected.to validate_presence_of(:author)}
  it {is_expected.to validate_presence_of(:content)}
  it {is_expected.to belong_to(:question)}
  it {is_expected.to belong_to(:author)}
  it {is_expected.to have_many(:comments)}
  it {is_expected.to have_many(:votes)}
  it "ensures only one answer can be voted best" do
    question = FactoryGirl.create(:question, author: @user)
    answer_1 = question.answers.create(author: @user, content: Faker::Lorem.paragraph)
    answer_2 = question.answers.create(author: @user, content: Faker::Lorem.paragraph)
    expect(Answer.find(answer_1.id).is_best).to eq(false)
    answer_1.is_the_best
    expect(Answer.find(answer_1.id).is_best).to eq(true)
    answer_2.is_the_best
    expect(Answer.find(answer_1.id).is_best).to eq(false)
    expect(Answer.find(answer_2.id).is_best).to eq(true)
  end
end

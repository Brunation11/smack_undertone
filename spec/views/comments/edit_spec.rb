require 'rails_helper'

RSpec.describe "comments/edit.html.erb", type: :view do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @question = @user.questions.create!(title: "Hello? blajndknjkasd", content: "dsknladnlsadlsandnsal")
    @comment = @user.questions.first.comments.create!(content: "helloooooooooooooooo", commentor: @user)
  end
  it 'shows the form to edit a comment' do
    @update_comment = FactoryGirl.create(:comment)
    render

    expect(rendered).to match @update_comment.content
  end
end

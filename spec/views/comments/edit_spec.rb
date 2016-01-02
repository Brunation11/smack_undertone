require 'rails_helper'

RSpec.describe "comments/edit.html.erb", type: :view do
  it 'shows the form to edit a comment' do
    @update_comment = FactoryGirl.create(:comment)
    render

    expect(rendered).to match @update_comment.content
  end
end

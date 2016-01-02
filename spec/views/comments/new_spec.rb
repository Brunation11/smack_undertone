require 'rails_helper'

RSpec.describe "comments/new.html.erb", type: :view do
  it 'shows the form to create a new comment' do
    render

    expect(rendered).to match /Message/
  end

end

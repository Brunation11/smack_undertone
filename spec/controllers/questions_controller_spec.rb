require 'rails_helper'
require 'factory_girl'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #root" do
    it "renders the :newest view" do
      get :newest
      expect(response).to render_template :newest
    end

    let(:user) {FactoryGirl.build(:user, username: Faker::Internet.user_name(10), email: Faker::Internet.email)}
    it "displays the most recent questions" do 
      Question.create!(title:'Hello', content: '1234567890', author: user)
      Question.create!(title:'Goodbye', content: '1234567890', author: user)
      get :newest
      expect(assigns(:most_recent)).to match(Question.order(created_at: :desc))
    end
  end

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #trending" do
    it "renders the :trending view" do
      get :trending
      expect(response).to render_template :trending
    end
  end


end

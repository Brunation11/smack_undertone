require 'spec_helper'

RSpec.describe SessionsController, type: :controller do

  context "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end
  context "#create" do
    let(:user) {FactoryGirl.create(:user)}
    it "redirects to root path if correct credentials" do
      post :create, username: user.username, password: user.password
      expect(response).to redirect_to root_path
    end
    it "redirects to login path with bad username" do
      post :create, username: Faker::Hipster.word, password: user.password
      expect(response).to render_template('new')
    end
    it "redirects to login path with bad password" do
      post :create, username: user.username, password: Faker::Internet.password
      expect(response).to render_template('new')
    end
  end
  context "#destroy" do
    before { delete :destroy }
    it { should set_session[:user_id].to(nil) }
  end
end
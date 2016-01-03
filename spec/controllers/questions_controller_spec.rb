require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  context "new" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
  end

end

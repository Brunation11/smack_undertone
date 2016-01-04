require 'rails_helper'
require 'factory_girl'
RSpec.describe CommentsController do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @question = @user.questions.create!(title: "Hello? blajndknjkasd", content: "dsknladnlsadlsandnsal")
    @comment = @user.questions.first.comments.create!(content: "helloooooooooooooooo", commentor: @user)
  end

  describe 'GET #new' do
    it 'shows the new comment form' do
      get :new, question_id: @question.id
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    it 'able to create a comment for question' do
      session[:user_id] = @user.id
      post :create, question_id: @question.id, :comment => { commentor: @user, content: "blahblahblahblahblah" }
      expect(response).to redirect_to question_path(@question.id)
    end

    it 'should render the comment form if comment fails' do
      post :create, { question_id: @question.id, :comment => { commentor: @user, content: "blah"} }
      expect(response).to redirect_to root_path
    end
  end

  describe 'GET #edit' do
    it 'should render the edit comment page' do
      get :edit, id: @comment.id
      expect(response).to render_template :edit
    end
  end

  describe 'PUT #update' do
    it 'should update the comment if it belongs to user' do
      session[:user_id] = @user.id
      put :update, id: @comment.id, :comment => { content: "hellooooooooooooood123oo" }
      expect(response).to redirect_to root_path
    end

    it 'should NOT update if not the user who created the comment' do
      session[:user_id] = @user2.id
      put :update, id: @comment.id, :comment => { content: "hellooooooooooooood123oo" }
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete the comment if it belongs to the user' do
      session[:user_id] = @user.id
      delete :destroy, id: @comment.id
      expect(response).to redirect_to question_path(@comment.commentable_id)
    end

    it 'should NOT delete the comment if it DOES NOT belong to the user' do
      session[:user_id] = @user2.id
      delete :destroy, id: @comment.id
      expect(response).to redirect_to root_path
    end
  end


end

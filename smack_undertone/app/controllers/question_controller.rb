class QuestionController < ApplicationController
  skip_before_action :ensure_logged_in, only: [:show]
  
  def new
    @qs = Question.new
  end

  def create
  end
end

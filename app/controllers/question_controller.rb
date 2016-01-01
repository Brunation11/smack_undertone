class QuestionController < ApplicationController
  skip_before_action :ensure_logged_in, only: :show

  def index
    @qs = Question.all
  end

  def new
    @qs = Question.new
  end

  def create
    @qs = current_user.questions.build(qs_params)
    if @qs.save
      redirect_to questions_path
    else
      render 'new'
    end    
  end

  private
  def qs_params
    params.require(:question).permit(:title, :content)
  end
end

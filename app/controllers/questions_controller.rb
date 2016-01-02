class QuestionsController < ApplicationController
  skip_before_action :ensure_logged_in, only: :index, :show

  def index
    @qs = Question.all
    @most_recent = Question.order(created_at: :desc).limit(10)
    @trending = Question.order(updated_at: :desc).limit(10)
    @highest_voted = Vote.
      where(votable_type: 'Question').
      order('sum_value DESC').
      group(:votable_id).
      limit(10).
      sum(:value)
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

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  def qs_params
    params.require(:question).permit(:title, :content)
  end
end

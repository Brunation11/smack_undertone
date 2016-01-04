class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    question = Question.find(params[:question_id])
    @answer = question.answers.build(author: current_user, content: params[:answer][:content])
    if @answer.save
      redirect_to question_path(question.id)
    else
      flash[:notice] = "Error creating answer"
      render :new
    end
  end


  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(content: params[:content])
      redirect_to question_path(@answer.question)
    else
      render :new
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    if answer.destroy
      redirect_to question_path(answer.question)
    else
      flash[:notice] = "There was a problem deleting the comment"
      redirect_to root_path
    end
  end
end

class AnswersController < ApplicationController

  def new
  end

  def create
    question = Question.find(params[:question_id])
    answer = question.answers.new(author: current_user, content: params[:answer][:content])
    if answer.save
      redirect_to question_path(question.id)
    else
      flash[:notice] = "Error creating answer"
      render :new
    end
  end


  def edit
    @answer = Answer.find(params[:id])
    render :new
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(content: params[:content])
      redirect_to question_path(@answer.question_id)
    else
      render :new
    end
  end

  def destroy
    answer = Answer.find(params[:id]).delete
    redirect_to root_path
  end
end

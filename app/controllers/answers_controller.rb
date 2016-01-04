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
    @question = @answer.question
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@answer.question)
    else
      render :edit
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

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end

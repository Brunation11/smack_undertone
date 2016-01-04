class CommentsController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new
  end

  def create
    binding.pry
    params[:question_id] ? question_comment : answer_comment
    if @new_comment.save
      redirect_to question_path(@new_comment.commentable_id)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.commentable_type == "Question"
      if valid_user(@comment) && @comment.update(content: params[:question][:content])
        redirect_to @comment.commentable
      else
        render :edit
      end
    elsif @comment.commentable_type == "Answer"
      if valid_user(@comment) && @comment.update(content: params[:answer][:content])
        redirect_to @comment.commentable
      else
        render :edit
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if valid_user(comment) && comment.destroy
      redirect_to question_path(comment.commentable_id)
    else
      flash[:notice] = "There was a problem deleting the comment"
      redirect_to root_path
    end
  end


  private
  def question_comment
    question = Question.find(params[:question_id])
    @new_comment = question.comments.new(commentor: current_user, content: params[:comment][:content])
  end

  def answer_comment
    answer = Answer.find(params[:answer_id])
    @new_comment = answer.comments.new(commentor: current_user, content: params[:comment][:content])
  end

  def valid_user(comment)
    current_user.id == comment.commentor_id
  end

end

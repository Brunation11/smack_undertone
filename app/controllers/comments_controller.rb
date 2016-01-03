class CommentsController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
  end

  def create
    params[:question_id] ? question_comment : answer_comment
    if new_comment.save
      redirect_to question_path(new_comment.commentable_id)
    else
      flash[:warning] = "There was a problem saving the comment"
      redirect_to root_path
    end
  end

  def edit
    @update_comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if valid_user(comment) && comment.update_attributes(update_param)
      redirect_to root_path
    else
      render :edit
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
  # def comments_param
    # params.require(:comment).permit(:commentor_id, :content, :commentable_type, :commentable_id)
  # end
  def question_comment
    question = Question.find(params[:question_id])
    @new_comment = question.comments.new(commentor: current_user, content: params[:comment][:content])
  end

  def answer_comment
    answer = Answer.find(params[:answer_id])
    @new_comment = answer.comments.new(commentor: current_user, content: params[:comment][:content])
  end

  def update_param
    params.require(:update_comment).permit(:content)
  end

  def valid_user(comment)
    current_user.id == comment.commentor_id
  end

end

class QuestionsController < ApplicationController
  skip_before_action :ensure_logged_in, only: [:index, :show]

  def index
    @questions = Question.all
  end

  def newest
    @questions = Question.all
    @most_recent = Question.order(created_at: :desc)
  end

  def trending
    @questions = Question.all
    @trending = Question.order(updated_at: :desc).limit(10)
  end

  def highest_voted
    @questions = Question.all
        # @highest_voted = Vote.
    #   where(votable_type: 'Question').
    #   order('sum_value DESC').
    #   group(:votable_id).
    #   limit(10).
    #   sum(:value)
    # @highest_voted = @highest_voted.map { |x| Question.find(x[0]) }

    @highest_voted = Question.joins(
      # Question.joins = SELECT questions.* FROM questions
      'JOIN (SELECT votable_id, SUM(value) AS score
      FROM votes WHERE votable_type = \'Question\'
      GROUP BY votable_id
      ORDER BY score DESC) v ON questions.id = v.votable_id'
      # Sub-join table with alias of v -- where v contains votable_id and sum of vote values (temp in memory) -- on questions.id and votable_id.
    )
  end

  def new
    @qs = Question.new
  end

  def create
    if logged_in?
      @qs = current_user.questions.build(qs_params)
      if @qs.save
        redirect_to questions_path
      else
        render 'new'
      end
    else
      @qs = Question.new
      @qs.errors.add(:user, "must be logged in")
      render 'new'
    end
  end

  def show
    @qs = find_qs
    @comments = @qs.comments
    @answers = @qs.answers
  end

  def edit
    @qs = find_qs
  end

  def update
    @qs = find_qs
    if @qs.update(qs_params)
      redirect_to @qs
    else
      render 'edit'
    end
  end

  def destroy
    @qs = find_qs
    @qs.destroy
    redirect_to questions_path
  end


  private
  def qs_params
    params.require(:question).permit(:title, :content)
  end

  def find_qs
    Question.find(params[:id])
  end
end

class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :question, :author, :content
  after_save :ensure_is_only_best


  def ensure_is_only_best

    if self.is_best
      Answer.where(question: question, is_best:true).where.not(id: id).update_all(is_best:false)
    end

  end

end

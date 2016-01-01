class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :author, class_name: 'User'
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates_presence_of :question, :author, :content

  def is_the_best
    Answer.where(question: question, is_best:true).where.not(id: id).update_all(is_best:false)
    self.update(is_best: true)
  end

end

class Question < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :answers, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy

  validates :content, length: { minimum: 10 }
  validates_presence_of :content, :title, :author
end

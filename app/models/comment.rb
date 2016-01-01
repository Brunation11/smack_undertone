class Comment < ActiveRecord::Base
  belongs_to :commentor, class_name: 'User'
  belongs_to :commentable, polymorphic: true

  validates_presence_of :commentor, :content, :commentable
  validates :content, length: { minimum: 10 }
end

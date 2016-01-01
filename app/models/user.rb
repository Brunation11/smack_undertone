class User < ActiveRecord::Base
  has_secure_password

  has_many :questions, foreign_key: :author_id, dependent: :destroy
  has_many :answers, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :commentor_id, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :username, :password, :email, presence: true
  validates_uniqueness_of :username, :email
  validates :username, length: { minimum: 4 }
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates_presence_of :password_confirmation
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

end

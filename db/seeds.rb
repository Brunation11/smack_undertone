# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(email:'steven@example.com', password:'abcdefghij', password_confirmation:'abcdefghij', username:'steven')
u2 = User.create!(email:'euni@example.com', password: '123456', password_confirmation: '123456', username:'euni')
u3 = User.create!(email:'bruno@example.com', password: '123456', password_confirmation: '123456', username:'bruno')

q1 = u1.questions.create!(title: "How can I #{Faker::Company.bs}?", content: Faker::Hipster.paragraphs(4).join)
q2 = u2.questions.create!(title: "How to reverse a stack recursively?", content: "To understand recursion, one must first understand recursion.")
q3 = u2.questions.create!(title: 'Polymorpha-what?', content: Faker::Hipster.paragraphs(4).join)

a1 = q1.answers.create!(author:User.last, content: Faker::Hacker.say_something_smart)
c1 = a1.comments.create!(content: Faker::Hacker.say_something_smart, commentor: User.last)

q1.votes.create!(value: -1, user: u1)

q2.votes.create!(value: -1, user: u2)
q2.votes.create!(value: 1, user: u1)

q3.votes.create!(value: 1, user: u1)
q3.votes.create!(value: 1, user: u2)

a1.votes.create!(value: -1, user: u1)
a1.votes.create!(value: 1, user: u2)
a1.votes.create!(value: -1, user: u3)

50.times do
  faker_password = Faker::Internet.password
  FactoryGirl.create(:user, username: Faker::Internet.user_name(4), email: Faker::Internet.email, password: faker_password, password_confirmation: faker_password)
end

users = User.all

100.times do
  FactoryGirl.create(:question, author: users.sample, content: Faker::Hipster.paragraphs(5).join)
end

questions = Question.all

200.times do
  FactoryGirl.create(:answer, author: users.sample, question: questions.sample, content: Faker::Hipster.paragraphs(3).join)
end

answers = Answer.all

400.times do
  FactoryGirl.create(:comment, commentor: users.sample, commentable:[questions.sample, answers.sample].sample)
end

comments = Comment.all

800.times do
  FactoryGirl.create(:vote, user: users.sample, votable:[questions.sample, answers.sample].sample)
end

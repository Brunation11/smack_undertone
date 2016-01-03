# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

us = User.create!(email:'steven@example.com', password:'abcdefghij', password_confirmation:'abcdefghij', username:'steven')
u2 = User.create!(email:'euni@example.com', password: '123456', password_confirmation: '123456', username:'euni')

qu = us.questions.create!(title: "How can I #{Faker::Company.bs}?", content: Faker::Hipster.paragraphs(4).join)
q2 = u2.questions.create!(title: "What does #{Faker::Company.bs} mean?", content: Faker::Hipster.paragraphs(4).join)
q3 = u2.questions.create!(title: 'Polymorpha-what?', content: Faker::Hipster.paragraphs(4).join)

an = qu.answers.create!(author:User.last, content: Faker::Hacker.say_something_smart)
an.comments.create!(content: Faker::Hacker.say_something_smart, commentor: User.last)

qu.votes.create!(value: 1, user: us)
an.votes.create!(value: -1, user: us)
an.votes.create!(value: -1, user: us)
an.votes.create!(value: 1, user: us)

q3.votes.create!(value: 1, user: us)
q3.votes.create!(value: 1, user: u2)

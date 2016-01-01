# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
us = User.create!(email:'steven@example.com', password:'abcdefghij', password_confirmation: 'abcdefghij', username:'steven')
qu = us.questions.create!(title:'a?', content:'babdsdfadfafdafafdaf')
an = qu.answers.create!(author:User.last, content:'abcdefghigdfaddsafasfads')
an.comments.create!(content: 'fgcfgdfgcfgfxg', commentor: User.last)
qu.votes.create!(value: 1, user: us)
an.votes.create!(value: -1, user: us)
an.votes.create!(value: -1, user: us)
an.votes.create!(value: -1, user: us)
an.votes.create!(value: 1, user: us)

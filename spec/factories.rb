FactoryGirl.define do

  factory :user do
    username {Faker::Lorem.characters(4)}
    email {Faker::Internet.email}
    # password {Faker::Internet.password(6)}
    password 'password123'
    password_confirmation 'password123'
  end

  factory :question do
    association :author, factory: :user
    title {Faker::Book.title}
    content {Faker::Lorem.sentence}
  end

  factory :answer do
    association :author, factory: :user
    association :question
    content {Faker::Lorem.paragraph}
    is_best {[true, false].sample}
  end

  factory :comment do
    association :commentor, factory: :user
    content {Faker::Lorem.paragraph}
    association :commentable, [{factory: :question}, {factory: :answer}].sample
  end

  factory :vote do
    association :user
    association :votable, [{factory: :question}, {factory: :answer}].sample
    value [1, -1].sample
  end
end

<<<<<<< HEAD
# FactoryGirl.create(:user)
# FactoryGirl.create(:question)
# FactoryGirl.create(:answer)
# FactoryGirl.create(:comment)
# FactoryGirl.create(:vote)
=======
FactoryGirl.create(:user)
FactoryGirl.create(:question)
FactoryGirl.create(:answer)
FactoryGirl.create(:comment)
FactoryGirl.create(:vote)
>>>>>>> comments_controller

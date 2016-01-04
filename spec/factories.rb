FactoryGirl.define do

  factory :user do
    username {Faker::Internet.user_name(10)}
    email {Faker::Internet.email}
    faker_password = Faker::Internet.password(10)
    password faker_password
    password_confirmation faker_password
  end

  factory :question do
    association :author, factory: :user
    title { "How can I #{Faker::Company.bs}?" }
    content { Faker::Hipster.paragraphs(4).join }
  end

  factory :answer do
    association :author, factory: :user
    association :question
    content {Faker::Lorem.paragraph}
    is_best false
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


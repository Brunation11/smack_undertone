FactoryGirl.define do
  factory :user do
    username Faker::Lorem.characters(5)
    email {"#{id}" + Faker::Internet.email}
    faker_password = Faker::Internet.password(6)
    password faker_password
    password_confirmation faker_password
  end

  factory :question do
    association :author, factory: :user
    title {Faker::Book.title}
    content {Faker::Lorem.sentence}
  end

  factory :answer do
    association :author, factory: :user
    association :question
    content {Faker::Lorem.sentence}
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


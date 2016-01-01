FactoryGirl.define do
  factory :user do
    username {Faker::Lorem.characters(4)}
    email {Faker::Internet.email}
    password = Faker::Internet.password(6)
    password password
    password_confirmation password
  end
end
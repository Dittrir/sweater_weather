FactoryBot.define do
  factory :user do
    name {Faker::DcComics.name}
    email {Faker::Internet.email}
    password_digest {Faker::DcComics.name}
  end
end

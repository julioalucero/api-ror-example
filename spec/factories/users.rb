FactoryGirl.define do
  factory :user do
    password              'supertest'
    sequence(:email)      { |n| "john_#{n}@test.com" }
    theme                 Enums::UserThemes::DEFAULT
    notification          true
    authentication_token  'abcde12345'
  end

end

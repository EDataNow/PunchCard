  FactoryGirl.define do

    factory :shift do
      association :location
    end

    factory :assignment do
      association :user
      association :shift
    end

    factory :workplace do
      association :user
      association :location
    end

    factory :user do
      admin false
      first_name Faker::Name.first_name
      last_name Faker::Name.last_name
      sequence(:email) {|n| "#{n}.#{last_name}@punchcard.net"}
      password {Faker::Internet.password(8,16)}
    end

    factory :location do
      name Faker::Address.city
      address Faker::Address.street_address
    end

end
FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'中村'}
    first_name            {'ジュんた'}
    last_name_kana        {'ミョウジ'}
    first_name_kana       {'ナマエ'}
    birthday              {Faker::Date.between(from: '2020-03-01', to: '2021-03-01')}
    introduction          {Faker::Lorem.paragraph}

    after(:build) do |user|
      user.user_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
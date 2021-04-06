FactoryBot.define do
  factory :message do
    content            {Faker::Lorem.sentence}

    association :user
    association :company
    association :room

    after(:build) do |message|
      message.message_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
FactoryBot.define do
  factory :company do
    company_name            {Faker::Name.name}
    email                   {Faker::Internet.free_email}
    password                {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
    company_phone           {'1312345678'}
    postal_code             {"1234567"}
    prefecture_id           {Faker::Number.between(from: 1, to: 47)}
    municipalities          {"新宿区"}
    house_number            {"新宿"}
    building                {"新宿ビル"}

    after(:build) do |company|
      company.company_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
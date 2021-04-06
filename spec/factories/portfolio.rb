FactoryBot.define do
  factory :portfolio do
    portfolio_name              {Faker::Commerce.product_name }
    detail                      {Faker::Lorem.paragraph}
    type_id                     {1}
    development_language_id     {Faker::Number.between(from: 1, to: 21)}
    business_type_id            {Faker::Number.between(from: 1, to: 3)} 
    sale_type_id                {0}
    price                       {Faker::Number.between(from: 0, to: 9999999)}
    association :user
    
    after(:build) do |portfolio|
      portfolio.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
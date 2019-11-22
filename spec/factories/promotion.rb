FactoryBot.define do
  factory :promotion do
    1..20.times do
      code {Faker::Commerce.unique.promotion_code(digits: 2)}
      active {Faker::Boolean.boolean}
      discount {Faker::Commerce.unique.price(range: 0..50)}
    end
  end
end

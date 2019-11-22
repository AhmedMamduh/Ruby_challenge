FactoryBot.define do
  factory :product do
    1..20.times do
      name {Faker::Commerce.unique.product_name}
      price {Faker::Commerce.unique.price}
      association :department
    end
  end
end

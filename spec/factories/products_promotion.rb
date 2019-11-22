FactoryBot.define do
  factory :products_promotion do
    1..20.times do
      association :product
      association :promotion
    end
  end
end

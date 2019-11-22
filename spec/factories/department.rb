FactoryBot.define do
  factory :department do
    1..20.times do
      name {Faker::Commerce.unique.department}
    end
  end
end

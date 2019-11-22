require 'database_cleaner'
begin
  DatabaseCleaner.clean_with(:truncation)
  20.times do
    Department.create(
      name: Faker::Commerce.unique.department(max: 1, fixed_amount: true)
      )
    Promotion.create(
      code: Faker::Commerce.unique.promotion_code(digits: 2),
      active: Faker::Boolean.boolean,
      discount: Faker::Commerce.unique.price(range: 0..50)
      )
  end
  20.times do
    Product.create(
      name: Faker::Commerce.unique.product_name,
      price: Faker::Commerce.unique.price,
      department_id: Random.rand(1..20)
      )
  end
  20.times do
    ProductsPromotion.create(
      product_id: Random.rand(1..20),
      promotion_id: Random.rand(1..20)
      )
  end
end
FactoryGirl.define do
  factory :product do
    title { Faker::Product.product_name }
    price { rand() * 100 }
    published false
    user_id "1"
  end
end

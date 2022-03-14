FactoryBot.define do
  factory :product do
    association :user
    product_name { "cosmetic" }
    price { 4000 }
    description { "This is an cosmetic products" }
  end
end

FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    description { 'テスト説明' }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
    price { 1000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('public/images/test_image.png')), filename: 'test_image.png')
    end
  end
end

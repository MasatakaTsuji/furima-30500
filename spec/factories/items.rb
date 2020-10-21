FactoryBot.define do
  factory :item do
    name             {'猿'}
    description      {'お猿'}
    category_id      { '2' }
    status_id        { '2' }
    burden_id        { '2' }
    prefecture_id    { '2' }
    ship_date_id     { '2' }
    selling_price    { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

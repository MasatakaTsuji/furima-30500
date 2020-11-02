FactoryBot.define do
  factory :order_ship do
    token         { 'tok_abcdefghijk00000000000000000' }
    postalcode    { '123-4567' }
    prefecture_id { 2 }
    shipaddess    { '横浜市緑区' }
    shiptoaddess  { '青山1-1-1' }
    shipbuilding  { '青木ビル103' }
    mobile        { '09012345678' }
  end
end

FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"passwor1"}
    password_confirmation {password}
    lname{"山田"}
    fname{"太郎"}
    lname_kana{"ヤマダ"}
    fname_kana{"タロウ"}
    birthday{"1990-10-20"}
  end
end
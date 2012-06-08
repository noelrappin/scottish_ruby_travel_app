# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :preference do
    preferrer nil
    key "MyString"
    value "MyString"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :extra do
    trip nil
    name "MyString"
    description "MyText"
    float ""
  end
end

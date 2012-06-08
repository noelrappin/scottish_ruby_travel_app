# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase_extra do
    extra ""
    purchase nil
    unit_count 1
    unit_price 1.5
  end
end

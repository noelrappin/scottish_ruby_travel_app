# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :purchase do
    buyer nil
    purchasable nil
    purchase_date "2012-06-08"
    real_travel_date "2012-06-08"
    amount 1.5
    length_of_stay 1
  end
end

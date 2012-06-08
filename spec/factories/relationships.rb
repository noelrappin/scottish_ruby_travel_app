# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :relationship do
    sender nil
    receiver nil
    status "MyString"
  end
end

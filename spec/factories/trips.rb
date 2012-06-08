# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trip do
    name "MyString"
    description "MyText"
    start_date "2012-06-08"
    end_date "2012-06-08"
    image_name "MyString"
    slug "MyString"
    tag_line "MyString"
    price 1.5
    location "MyString"
    activity "MyString"
  end
end

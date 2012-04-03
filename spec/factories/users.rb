# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "linkedin"
    uid "feF0FAcU-m"
    name "Shyam Mohan"
    email ""
  end
end

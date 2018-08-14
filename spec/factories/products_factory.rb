FactoryBot.define do
  factory :product do
    title "title"
    description "this is description"
    price 9.99
    category { create(:category) }
  end
end

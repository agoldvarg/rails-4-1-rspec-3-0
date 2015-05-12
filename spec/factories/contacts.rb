FactoryGirl.define do
  factory :contact do
    firstname "John"
    lastname "Doe"
    sequence(:email) { |i| "johndoe#{i}@example"}
  end
end

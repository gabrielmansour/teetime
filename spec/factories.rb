FactoryGirl.define do
  factory :user do
    name "Tiger Woods"
  end

  factory :booking do
    starts_at Time.now.beginning_of_hour
    association :user
  end
end

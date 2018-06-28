FactoryGirl.define do
  factory :event do
    association :issue, factory: :issue
    action 'action'
  end
end

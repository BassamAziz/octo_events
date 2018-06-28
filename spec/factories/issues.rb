FactoryGirl.define do
  factory :issue do
   	sequence :number do |n|
   		n
   	end
    state :open
  end
end

FactoryGirl.define do
	factory :event do |f|
	  f.sequence(:name) { |n| "foo#{n}" }
	  f.sequence(:key) { |n| "foobar#{n}" }
	  f.start_date Date.today - 2
	  f.end_date Date.today
	end
end
FactoryGirl.define do
  factory :part do |f|
    f.sequence(:name) { |n| "foo#{n}" }
    f.sequence(:description) { |n| "foobar#{n}" }
    f.sequence(:number) { |n| "N0012383#{n}" }
    f.qty "2"
  end
end

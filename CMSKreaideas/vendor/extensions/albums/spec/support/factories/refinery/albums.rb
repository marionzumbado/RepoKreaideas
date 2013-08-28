
FactoryGirl.define do
  factory :album, :class => Refinery::Albums::Album do
    sequence(:name) { |n| "refinery#{n}" }
  end
end


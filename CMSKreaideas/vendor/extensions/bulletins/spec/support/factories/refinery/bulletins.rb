
FactoryGirl.define do
  factory :bulletin, :class => Refinery::Bulletins::Bulletin do
    sequence(:title) { |n| "refinery#{n}" }
  end
end


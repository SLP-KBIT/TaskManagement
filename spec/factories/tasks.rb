require 'faker'

FactoryGirl.define do
  factory :feature_task, class: Task do
    title { Faker::Lorem.sentence }
    detail { Faker::Lorem.paragraph }
  end
end


FactoryGirl.define do
  factory :finished_task, class: Task do
    title { Faker::Lorem.sentence }
    detail { Faker::Lorem.paragraph }
    finished true
  end
end

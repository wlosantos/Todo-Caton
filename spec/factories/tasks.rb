FactoryBot.define do
  factory :task do
    description { Faker::Lorem.sentence }
    due_date { Faker::Date.in_date_period }
    done { [true, false].sample }
  end
end

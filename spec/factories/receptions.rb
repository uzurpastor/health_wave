# frozen_string_literal: true

FactoryBot.define do
  factory :reception do
    id { 1 }
    user_id { 1 }
    doctor_id { 1 }
    description { Faker::Lorem.paragraph(sentence_count: 3) }
    status { :appoint }
    time { DateTime.now }
  end
end

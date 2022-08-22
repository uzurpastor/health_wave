# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'Doe' }
    phone { Faker::PhoneNumber.cell_phone }
    email { 'doe@example.com' }
    password { 'passwd' }
  end
end

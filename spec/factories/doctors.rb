# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    id { 1 }
    name { 'John' }
    category { Doctor.categories.keys.sample }
    email { 'john@example.com' }
    password { 'passwd' }
  end
end

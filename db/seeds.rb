# frozen_string_literal: true

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

## Users
30.times do
  name      = Faker::Name.first_name
  email     = Faker::Internet.free_email name: name
  phone     = Faker::PhoneNumber.cell_phone
  password  = Faker::Internet.password min_length: 6
  User.create!(name: name,
               email: email,
               phone: phone,
               password: password,
               password_confirmation: password)
end

## Doctors
5.times do
  name      = Faker::Name.first_name
  email     = Faker::Internet.free_email name: name
  password  = Faker::Internet.password min_length: 6
  category  = Doctor.categories.keys.sample
  Doctor.create!(name: name,
                 email: email,
                 category: category,
                 password: password,
                 password_confirmation: password)
end

## Receptions
20.times do
  user        = User.all.sample
  doctor      = Doctor.all.sample
  description = Faker::Lorem.paragraph sentence_count: 3

  user.receptions.create!(doctor_id: doctor.id,
                          status: 'considering',
                          description: description)
end

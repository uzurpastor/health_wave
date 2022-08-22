# frozen_string_literal: true

AdminUser.create!(email: 'admin@example.com', password: 'password',
                  password_confirmation: 'password')
User.create( name: 'Username',
             email: 'user@mail.com',
             phone: '099123456',
             password: 'passwd',
             password_confirmation: 'passwd')

Doctor.create( name: 'Username',
               email: 'doctor@mail.com',
               category: 'endocrinologist'
               password: 'passwd',
               password_confirmation: 'passwd')
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
70.times do
  user        = User.all.sample
  doctor      = Doctor.all.sample
  description = Faker::Lorem.paragraph sentence_count: 3

  user.receptions.create(doctor_id: doctor.id,
                         status: 'considering',
                         description: description)
end

Reception.all.sample(20).each do |r|
  r.time = DateTime.now + SecureRandom.random_number(30)
  r.status = :waiting
  r.save
end

Reception.all.sample(20).each do |r|
  r.response = Faker::Lorem.paragraph sentence_count: 3
  r.status = :reply
  r.save
end

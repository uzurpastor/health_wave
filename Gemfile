# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'net-http'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

## Style
gem 'sassc-rails'

## Authorization
gem 'cancancan'
gem 'devise'

## Admin panel
gem 'activeadmin'

## Storage
gem 'aws-sdk-s3'
##
group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'rubocop', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'rspec-rails'

  ## Web utils
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'

  ## Generating fake data
  gem 'factory_bot_rails'
end

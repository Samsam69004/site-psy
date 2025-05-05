source "https://rubygems.org"

ruby "3.1.2"

gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "devise"
gem "nokogiri", "~> 1.15"
gem "image_processing", "~> 1.2"
gem "tailwindcss-rails", "~> 2.0"
gem "cssbundling-rails"
gem "activeadmin"
gem "sassc-rails"
gem "actiontext"
gem "securerandom", "~> 0.4.1", require: false
gem "bootsnap", require: false

gem "dotenv-rails", groups: [:development, :test]
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop", require: false
  gem "rubocop-rails", require: false
  gem "rspec-rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

source "https://rubygems.org"

# Specify your gem's dependencies in gig.gemspec
gemspec

gem "rake", "~> 12.0"

# Library for making http requests
gem "httparty"

group :development do
  # Library for debugging using breakpoints
  gem "pry-byebug"
end

# Installing gems for testing
group :test do
  gem "rspec", "~> 3.0"
  # Library needed to mock responses
  gem "webmock"
end

# Gig

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/gig`. To experiment with that code, run `bin/console` for an interactive prompt.

This gem focuses on github's search api for repositories and downloading repositories's owner images. More information can be found [here](https://docs.github.com/en/free-pro-team@latest/rest/reference/search#search-repositories).

You can find the gem's page on rubygems.org [here](https://rubygems.org/gems/gig2).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gig2'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install gig2

## Usage

Once you've installed gig, you should be able to run the gem by executing the following command `bin/gig <argument> <argument>`. You can find out what qualifies as an argument in the [github documentation](https://docs.github.com/en/free-pro-team@latest/rest/reference/search#search-repositories).

Example of a command to run is `bin/gig topic:ruby topic:rails`.

If your response is a good one (status 200) then the program will retrieve each owner of the relative repositories returned and downloach each one's image. These images will be downloaded to
a directory at the root of your project. The directory's name represents the query you made e.g. from the example above the directory would be called `topic:ruby-topic:rails`.

The github API has a rate limit of no more than 10 requests per second. If this rate limit is hit then you should see a message that explains what has happened and how long till you can make a request. Please find out more [here](https://docs.github.com/en/free-pro-team@latest/rest/reference/search#rate-limit)

You should also see a message if any other status code apart from 200 is returned from the API. Please find out more about which status codes could be returned here [here](https://docs.github.com/en/free-pro-team@latest/rest/reference/search#search-repositories).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

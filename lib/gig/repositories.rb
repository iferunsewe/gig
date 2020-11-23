module Gig
  class Repositories
    attr_reader :query, :owners, :response
    API_PATH = '/search/repositories'.freeze

    def initialize(query)
      @query = query
      @owners = []
      @response = nil
    end

    def search
      puts 'Searching for repositories....'
      request_repositories
      return handle_ok_response if response.code == 200
      return !handle_hit_rate_limit if response.code == 403 && rate_limit_hit?

      puts "Status: #{response.code}. Message: #{response.parsed_response['message']}"
      false
    end

    private

    def request_repositories
      @response = HTTParty.get(
        "https://api.github.com#{API_PATH}",
        query: {
          q: query
        },
        headers: headers
      )
    end

    def headers
      {
        'Accept' => 'application/vnd.github.v3+json'
      }
    end

    def handle_ok_response
      puts "Found #{response.parsed_response['total_count']} repositories"
      return false if response.parsed_response['total_count'].zero?

      @owners = response.parsed_response['items'].map { |item| item['owner'] }
      true
    end

    def handle_hit_rate_limit
      return false unless rate_limit_hit?

      rate_limit_limit = response.headers['x-ratelimit-limit'][0]
      rate_limit_reset = response.headers['x-ratelimit-reset'][0]
      time_til_limit_reset = rate_limit_reset - Time.now.to_i
      puts "You are attempting to make more than #{rate_limit_limit} requests in a minute. " \
            "This is not allowed so please wait #{time_til_limit_reset} seconds before making the next request. " \
            "Please find out more information here https://developer.github.com/v3/#rate-limiting"
      true
    end

    def rate_limit_hit?
      rate_limit_remaining = response.headers['x-ratelimit-remaining'][0]
      rate_limit_remaining.to_i.zero?
    end
  end
end

module Gig
  class Repositories
    attr_reader :query, :owners
    API_PATH = '/search/repositories'.freeze

    def initialize(query)
      @query = query
      @owners = []
    end

    def search
      puts 'Searching for repositories....'
      response = request
      if response.code == 200
        puts "Found #{response.parsed_response['total_count']} repositories"
        return false if response.parsed_response['total_count'].zero?

        @owners = request.parsed_response['items'].map { |item| item['owner'] }
        return true
      end
      puts "Status: #{response.code}. Message: #{code_to_message(response.code)}"
      false
    end

    private

    def request
      HTTParty.get(
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

    def code_to_message(code)
      message_hash = {
        '304': 'Not Modified',
        '422': 'Validation Failed. Please check your request is following the documentation outlined here https://docs.github.com/en/free-pro-team@latest/rest/reference/search',
        '503': 'The github service unavailable is currently unavailable. Please try again later'
      }
      message_hash[code.to_s.to_sym]
    end
  end
end

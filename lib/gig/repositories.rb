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
        true
      end
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
  end
end

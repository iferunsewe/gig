module Gig
  class Gig
    attr_reader :query, :directory, :repositories

    def initialize(args)
      raise ArgumentError.new('You must provide some arguments to build a search query') if args.count.zero?

      @directory = args.join('-')
      @query = args.join(' ')
      @repositories = nil
    end

    def run
      puts 'Running gig...'
      @repositories = intialize_repositories
      return false unless @repositories.search

      @repositories.owners.each do |response|
        Downloader.run(directory, response['login'], response['avatar_url'])
      end
      true
    end

    private

    def intialize_repositories
      Repositories.new(query)
    end
  end
end

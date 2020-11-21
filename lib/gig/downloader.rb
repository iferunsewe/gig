# A Module to deal with downloading files/images given a path and a uri
module Gig
  module Downloader
    def self.run(directory, filename, uri)
      Dir.mkdir(directory) unless Dir.exist?(directory)

      path = "#{Dir.pwd}/#{directory}/#{filename}.jpg"
      URI.open(path, 'wb') do |file|
        puts "Downloading #{filename}.jpg to #{Dir.pwd}/#{directory}"
        file << URI.open(uri).read
      end
    end
  end
end

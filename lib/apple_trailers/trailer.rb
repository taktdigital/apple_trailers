require 'nokogiri'

module AppleTrailers
  class Trailer
    attr_accessor :movie, :url, :type

    def initialize(options)
      options.each { |key, value| instance_variable_set("@"+key.to_s, value)}
    end
    
    def title
      "#{@movie.title} - #{@type}"
    end
  end
end
module AppleTrailers
  class Trailer
    attr_accessor :movie, :url, :type

    def initialize(options)
      options.each { |key, value| instance_variable_set("@"+key.to_s, value)}
    end

    def description
      "#{@movie.title}: A #{@movie.genre} produced by #{@movie.studio}.  For more information visit #{@movie.moviesite}"
    end

    def title
      "#{@movie.title} - #{@type}"
    end
  end
end
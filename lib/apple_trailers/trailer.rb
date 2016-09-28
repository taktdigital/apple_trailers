require 'nokogiri'

module AppleTrailers
  class Trailer
    attr_accessor :movie, :type, :runtime, :posted, :srcs

    def initialize(options)
      options.each { |key, value| instance_variable_set("@"+key.to_s, value)}
    end

	  def best
	  	data = {
	  		title: @movie.title,
	  		rating: @movie.rating,
	  		genre: @movie.genre,
	  		type: @type,
	  		runtime: @runtime,
	  		posted: @posted
	  	}
	  	if @srcs["hd1080"]
	  		data["src"] = @srcs["hd1080"]["src"]
	  	elsif @srcs["hd720"]
	  		data["src"] = @srcs["hd720"]["src"]
			else
	  		data["src"] = @srcs["sd"]["src"]
			end
			data
	  end
  end
end
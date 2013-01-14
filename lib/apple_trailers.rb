require "apple_trailers/version"
require "apple_trailers/movie"
require "apple_trailers/trailer"
require 'json'
require 'net/http'

module AppleTrailers
  @@protocol = "http://"
  @@trailer_domain = "trailers.apple.com"
  @@trailer_path = "/trailers/home/feeds/just_added.json"

  def AppleTrailers.just_added
    parse_movies(JSON.parse(Net::HTTP.get(@@trailer_domain, @@trailer_path)))
  end

  def AppleTrailers.parse_movies(movie_list)
    movie_list.collect do |trailer_info|
      Movie.new({ 
        location: trailer_info['location'], 
        title: trailer_info['title'],
        moviesite: trailer_info['moviesite'],
        rating: trailer_info['rating'], 
        genre: trailer_info['genre'][0],
        studio: trailer_info['studio']
      })
    end
  end
end

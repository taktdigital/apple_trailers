# AppleTrailers

Pulls recently added movie trailers from trailers.apple.com.  Includes basic information about the movie, including genre, production studio, title, release date, rating, and the url of the highest definition videos available.

## Installation

Add this line to your application's Gemfile:

    gem 'apple_trailers'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apple_trailers

## Usage

    movies = AppleTrailers.just_added
    
    movies.count
     => 80 
     
    movie = movies.first
    
    movie.title
     => "A Place at the Table" 
    
    movie.studio
     => "Magnolia Pictures" 
    
    movie.rating
     => "PG"
    
    movie.genre
     => "Documentary"
     
    movie.trailers.first.title
     => "A Place at the Table - Trailer" 
     
    movie.trailers.first.description
     => "A Place at the Table: A Documentary produced by Magnolia Pictures.  For more information visit http://www.facebook.com/aPlaceAtTheTableMovie" 
    
    movie.trailers.first.url
     => "http://trailers.apple.com/movies/magnolia_pictures/aplaceatthetable/aplaceatthetable-tlr1_h1080p.mov"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

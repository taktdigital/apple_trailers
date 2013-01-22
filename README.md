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
     => "The Call"
    
    movie.studio
     => "Sony Pictures" 
    
    movie.rating
     => "Not yet rated"
    
    movie.genre
     => "Thriller"
     
    movie.description
     => "When veteran 911 operator, Jordan (Halle Berry), takes a life-altering call from a teenage girl (Abigail Breslin) who has just been abducted, she realizes that she must confront a killer from her past in order to save the girl's life."
     
    movie.trailers.first.title
     => "The Call - Trailer" 
     
    movie.trailers.first.url
     => "http://trailers.apple.com/movies/magnolia_pictures/aplaceatthetable/aplaceatthetable-tlr1_h1080p.mov"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

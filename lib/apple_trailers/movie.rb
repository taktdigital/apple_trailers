require 'nokogiri'

module AppleTrailers
  class Movie
    attr_accessor :location, :title, :moviesite, :rating, :genre, :studio

    def initialize(options)
      options.each { |key, value| instance_variable_set("@"+key.to_s, value)}
    end

    def trailers
      doc = Nokogiri::HTML(Net::HTTP.get(URI(["http://trailers.apple.com", @location, "includes/playlists/web.inc"].join(''))))
      doc.css('.trailer').count > 1 ? get_multiple_trailers(doc) : get_single_trailer(doc)
    end

    def get_single_trailer(doc)
      trailer = doc.css('.target-quicktimeplayer').max { |b1, b2| b1.text.to_i <=> b2.text.to_i}
      [ Trailer.new({ movie: self, url: trailer.attributes['href'].value, type: doc.css('h3').first.content }) ]
    end

    def get_multiple_trailers(doc)
      trailer_groups = doc.css('.trailer')
      hd_trailers = trailer_groups.reject {  |group| group.css('.target-quicktimeplayer').empty? }.collect { |group| group.css('.target-quicktimeplayer').max { |b1, b2| b1.text.to_i <=> b2.text.to_i} }
      hd_trailers.collect { |trailer| Trailer.new({ movie: self, url: trailer.attributes['href'].value, type: doc.css('h3').first.content }) }
    end
  end
end
require 'nokogiri'

module AppleTrailers
  class Movie
    attr_accessor :location, :title, :moviesite, :rating, :genre, :studio, :directors, :actors

    def initialize(options)
      options.each { |key, value| instance_variable_set("@"+key.to_s, value)}
    end

    def description
      doc = get_details
      doc["details"]["locale"].first[1]["synopsis"]
    end

    def all_trailers
      doc = get_details
      doc["clips"].collect do |clip|
        Trailer.new({movie: self, type: clip["title"], runtime: clip["runtime"], posted: clip["posted"], srcs: clip["versions"]["enus"]["sizes"]})
      end
    end

    def latest_best_trailer
      doc = get_details
      trailers = doc["clips"].collect do |clip|
        Trailer.new({movie: self, type: clip["title"], runtime: clip["runtime"], posted: clip["posted"], srcs: clip["versions"]["enus"]["sizes"]})
      end

      trailers.sort_by {|trailer| trailer.posted}.pop.best
    end

    private

    def get_details
      temp_doc = Nokogiri::HTML(Net::HTTP.get(AppleTrailers.domain, @location))
      id = temp_doc.at('meta[@name="apple-itunes-app"]').attributes["content"].value.split("/").pop
      JSON.parse(Net::HTTP.get(AppleTrailers.domain, "/trailers/feeds/data/#{id}.json"))
    end
  end
end
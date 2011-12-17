require 'previews/version'
require 'previews/array'
require 'previews/hirb_vertical_table'

module Previews
  class PackageReviews
    def initialize(locale, release, package)
      @url    = "http://reviews.ubuntu.com/reviews/api/1.0/reviews/filter/#{locale}/ubuntu/#{release}/any/#{package}/"
      @reviews = []
    end

    def reviews
      self.download_reviews
      @reviews.flatten!
      self.replace_rating_with("★", "☆")
      self.parse_date_time

      @reviews
    end

    def parse_date_time
      @reviews.each do |review|
        review['date_created'] = DateTime.parse(review['date_created']) # .strftime("%e %b %Y %H:%m:%S%p")
      end
    end

    # Replace each review's rating into some symbols
    # Like replace_rating_with("★", "☆")
    def replace_rating_with(up, empty)
      @reviews.each do |review|
        review['rating'] = up * review['rating'] + empty * (5 - review['rating'])
      end
    end

    # Get all reviews
    # Return Array of Hashes
    def download_reviews
      page = 1
      loop do
        @reviews << download_page(page)
        break if @reviews.last.empty?
        page += 1
      end
    end

    # Get the one page of reviews.
    # Return Array of Hashes
    def download_page(page_number)
      print '.'
      JSON.parse(Net::HTTP.get(URI(@url + "page/#{page_number}/")))
    end
  end
end

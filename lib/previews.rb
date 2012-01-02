# -*- coding: utf-8 -*-
require 'rubygems'
require 'json'
require 'net/http'
require 'previews/version'
require 'previews/array'
require 'previews/hirb_vertical_table'

module Previews
  class PackageReviews
    def initialize(locale, release, package)
      @url    = "http://reviews.ubuntu.com/reviews/api/1.0/reviews/filter/#{locale}/ubuntu/#{release}/any/#{package}/"
      @reviews = []
    end

    # Return Array of Hases
    def reviews
      download_reviews
      @reviews.flatten!
    end

    private
    # Get all reviews
    # Return Array of Hashes
    def download_reviews
      (1..1/0.0).map do |page|
        @reviews << download_page(page)
        break if @reviews.last.empty?
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

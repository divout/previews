require 'tc_helper'

class TestArray < Test::Unit::TestCase
  def setup
    @reviews = [{"origin"=>"ubuntu",
      "rating"=>5,
      "hide"=>false,
      "app_name"=>"VLC media player",
      "language"=>"en",
      "reviewer_username"=>"p8KFRbG",
      "usefulness_total"=>3,
      "usefulness_favorable"=>2,
      "review_text"=>"I have one on my Windows 7. And now on Ubuntu",
      "date_deleted"=>nil,
      "summary"=>"Great player!!",
      "version"=>"1.1.12-2~oneiric1",
      "id"=>27925,
      "date_created"=>"2011-11-01 00:39:57",
      "reviewer_displayname"=>"Ruden Estolonio",
      "package_name"=>"vlc",
      "distroseries"=>"oneiric"},
      {"origin"=>"ubuntu",
      "rating"=>3,
      "hide"=>false,
      "app_name"=>"VLC media player",
      "language"=>"en",
      "reviewer_username"=>"javanmardy",
      "usefulness_total"=>2,
      "usefulness_favorable"=>1,
      "review_text"=>"Useful but it ant show subtitles on another language",
      "date_deleted"=>nil,
      "summary"=>"Could be better",
      "version"=>"1.1.12-2~oneiric1",
      "id"=>28416,
      "date_created"=>"2011-11-04 05:35:45",
      "reviewer_displayname"=>"Behrouz",
      "package_name"=>"vlc",
      "distroseries"=>"oneiric"}]
  end

  def test_replace_rating_with
    @reviews.replace_rating_with('+','-')
    assert_equal '+++++', @reviews[0]['rating']
    assert_equal '+++--', @reviews[1]['rating']
  end

  def test_parse_date_time
    @reviews.parse_date_time
    assert_equal '2011-11-01T00:39:57+00:00', @reviews[0]['date_created'].to_s
    assert_equal '2011-11-04T05:35:45+00:00', @reviews[1]['date_created'].to_s
  end

  def test_sort_with_usefulness_desc
    initial_reviews = @reviews
    @reviews.sort_with!('usefulness', 'desc')
    assert_equal initial_reviews, @reviews
  end

  def test_sort_with_usefulness_asc
    @reviews.sort_with!('usefulness', 'asc')
    assert_equal 28416, @reviews[0]['id']
    assert_equal 27925, @reviews[1]['id']
  end

  def test_sort_with_date_created_desc
    @reviews.parse_date_time
    @reviews.sort_with!('date_created', 'desc')
    assert_equal 28416, @reviews[0]['id']
    assert_equal 27925, @reviews[1]['id']
  end

  def test_sort_with_date_created_asc
    @reviews.parse_date_time
    @reviews.sort_with!('date_created', 'asc')
    assert_equal 27925, @reviews[0]['id']
    assert_equal 28416, @reviews[1]['id']
  end

  def test_sort_with_rating_asc
    @reviews.sort_with!('rating', 'asc')
    assert_equal 28416, @reviews[0]['id']
    assert_equal 27925, @reviews[1]['id']
  end

  def test_sort_with_rating_desc
    @reviews.sort_with!('rating', 'desc')
    assert_equal 27925, @reviews[0]['id']
    assert_equal 28416, @reviews[1]['id']
  end
end
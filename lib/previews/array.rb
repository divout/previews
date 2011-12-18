class Array
  # Using Hirb to print reviews.
  # :fields is fields to display
  # print out :vertical table
  # HEADERS is Hash of headers
  # passing system_less as a option
  def print_with(fields, system_less)
    extend Hirb::Console
    table self, :fields      => fields,
                :vertical    => true,
                :headers     => HEADERS,
                :system_less => system_less
  end

  # By default reviews sorted by usefulness. We can reverse it to sort by ascending
  # For others fields we sorting by comparing each element of Array
  def sort_with!(field, direction)
    return self          if 'usefulness' == field && 'desc' == direction
    return self.reverse! if 'usefulness' == field && 'asc'  == direction
    if 'asc' == direction
      self.sort! { |review1, review2| review1[field] <=> review2[field]}
    elsif 'desc' == direction
      self.sort! { |review1, review2| review2[field] <=> review1[field]}
    end
  end

  # Parses all 'date_created' fields to DateTime object
  def parse_date_time
    self.each do |review|
      review['date_created'] = DateTime.parse(review['date_created'])
    end
  end

  # Replace each review's rating into some symbols
  # Usage: array.replace_rating_with("★", "☆")
  def replace_rating_with(up, empty)
    self.each do |review|
      review['rating'] = up * review['rating'] + empty * (5 - review['rating'])
    end
  end
end
class Array
  def print_with(fields, system_less)
    extend Hirb::Console
    table self, :fields      => fields,
                :vertical    => true,
                :headers     => HEADERS,
                :system_less => system_less
  end

  def sort_with!(field, direction)
    self          if 'usefulness' == field && 'desc' == direction
    self.reverse! if 'usefulness' == field && 'asc'  == direction
    if 'asc' == direction
      self.sort! { |review1, review2| review1[field] <=> review2[field]}
    else
      self.sort! { |review1, review2| review2[field] <=> review1[field]}
    end
  end
end
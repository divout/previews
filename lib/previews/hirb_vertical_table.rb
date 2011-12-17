require 'hirb-unicode'

class Hirb::Helpers::VerticalTable < Hirb::Helpers::Table
  # Method should return an Array
  def render_rows
    i = 0
    rows = ''
    longest_header = Hirb::String.size @headers.values.sort_by {|e| Hirb::String.size(e) }.last
    delimiter = "-" * longest_header
    @rows.map do |row|
      row = "\n#{delimiter} #{i+1}. review #{delimiter}\n" +
      @fields.map {|f|
        if !@options[:hide_empty] || (@options[:hide_empty] && !row[f].empty?)
          "#{Hirb::String.rjust(@headers[f], longest_header)}: #{row[f]}"
        else
          nil
        end
      }.compact.join("\n")
      i+= 1
      rows += row
    end
    rows = "#{@rows.size} review(s)" + rows
    if @options[:system_less] && system("which less 2>&1 > /dev/null")
      IO.popen('less', 'w') { |io| io.puts rows }
      []
    else
      [rows]
    end
  end
end
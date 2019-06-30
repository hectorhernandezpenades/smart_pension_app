require_relative 'lib/log_analyzer'

parser = LogAnalyzer.new(ARGV[0])
parser.parsing

def logs_display(data)
  data.each do |k, array|
    puts "#{k} => #{array}"
  end
end

puts "\r"
puts '- LOGS REPORT -'
puts "\r"
puts 'Most viewed sites sorted descending (url => times visited):'
puts "\r"
logs_display(parser.most_views)
puts "\r"
puts '-------------------'
puts "\r"
puts 'Most unique viewed sites sorted descending (url => times visited):'
puts "\r"
logs_display(parser.unique_views)

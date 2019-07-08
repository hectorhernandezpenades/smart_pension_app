class LogAnalyzer
  def initialize(file_path)
    @file = File.open(file_path)
    @log_stats = Hash.new { |h, k| h[k] = [] }
  end

  def parsing
    @file.each do |line|
      path, ip = line.split(' ')
      @log_stats[path] << ip
    end
    @log_stats
  end

  def most_views
    counter
    @counts.sort_by { |_k, v| v }.reverse.to_h
  end

  def unique_views
    @log_stats.each do |k, _v|
      @log_stats[k].uniq!
    end
    counter
    @counts.sort_by { |_k, v| v }.reverse.to_h
  end

  private

  def counter
    @counts = {}
    @log_stats.each do |k, _v|
      @counts[k] = @log_stats[k].length
    end
    @counts
  end
end

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
    most_views = {}
    @log_stats.each do |key, value|
      most_views[key] = @log_stats[key].length
    end
    most_views = most_views.sort_by { |_k, v| v }.reverse.to_h
  end

  def unique_views
    @log_stats.each do |k, _v|
      @log_stats[k].uniq!
    end
    log_stats_unique = {}
    @log_stats.each do |key, value|
      log_stats_unique[key] = @log_stats[key].length
    end
    log_stats_unique = log_stats_unique.sort_by { |_k, v| v }.reverse.to_h
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

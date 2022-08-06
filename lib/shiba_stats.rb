require 'shiba_stats_helper'

class ShibaStats
  ActionView::Base.send :include, ShibaStatsHelper 

  def self.add(key, amount)
    time_series(key).add(amount)
  end

  def self.count(key, amount = 1)
    time_series(key).incrby(amount)
  end

  def self.time_series(key)
    Redis::TimeSeries.new(key)
  end
end
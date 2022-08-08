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
    redis ||= Redis.new(
      :host => ENV["REDIS_HOST"],
      :port => ENV["REDIS_PORT"],
      :password => ENV["REDIS_PASSWORD"]
    )
    Redis::TimeSeries.new(key, redis: redis)
  end

end
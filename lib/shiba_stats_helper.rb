module ShibaStatsHelper

  def shiba_line(keys, chart_options = {}, options = {})
    line_chart prepare_data(keys, options), **chart_options 
  end

  def shiba_area(keys, chart_options = {}, options = {})
    chart_options[:stacked] ||= true
    area_chart prepare_data(keys, options), **chart_options 
  end

  def shiba_bar(keys, chart_options = {}, options = {})
    bar_chart prepare_data(keys, options), **chart_options
  end

  def shiba_pie(keys, chart_options = {}, options = {})
    pie_chart(prepare_pie_data(keys, options), **chart_options)
  end

  def prepare_data(keys, options)
    keys = [keys] unless keys.is_a?(Array)
    data = [] 
    options[:start_time] ||= Time.zone.now - 24.hours
    options[:end_time] ||= Time.zone.now
    options[:aggregation_period] ||= 1.minute
    options[:aggregation_type] ||= :count

    keys.each do |key|
      key_data = { name: key, data: {}}
      time_series = ShibaStats.time_series(key).range(
        options[:start_time]..options[:end_time], 
        aggregation: [options[:aggregation_type], options[:aggregation_period]]
      )  
      time_series.each do |point|
        key_data[:data][point.time] = point.value
      end

      data << key_data
    end

    return data
  end

  def prepare_pie_data(keys, options)
    keys = [keys] unless keys.is_a?(Array)
    data = {}

    keys.each do |key|
      time_series = ShibaStats.time_series(key).range(Time.zone.now-24.hours..Time.zone.now)
      data[key] = time_series.count
    end

    return data
  end

end

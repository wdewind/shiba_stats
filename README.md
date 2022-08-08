# ShibaStats

A small library for measuring stuff.  

**NOTE**: You must have the Redis Time Series module for ShibaStats.  See: https://redis.io/docs/stack/timeseries/

## Installation

```
gem 'shiba_stats'
```

ShibaStats reads from the REDIS_URL, REDIS_PORT and REDIS_PASSWORD ENV variables.

## Recording Data
Increment a key:
```
ShibaStats.count('key')
```

Increment a key by a specific amount:
```
ShibaStats.count('key', amount)
```

Track a specific amount (for instance, page load times):
```
ShibaStats.add('key', amount)
```

## Displaying Data

The ShibaStatsHelper will display the graphs using chartkick.  All of the methods take in a key or array of keys, options for the chart (title, colors, etc. see: https://github.com/ankane/chartkick) and options for the data (start and end times, aggregation period/type etc. see: https://github.com/dzunk/redis-time-series).

### Line Graph

```
<%= shiba_line('my_key') %>
```

```
<%= shiba_line('my_key', 
    { 
      title: "My Graph" 
    }, 
    {
      start_time: Time.zone.now-10.minutes, 
      aggregation_period: 1.second
    } 
  ) 
%>
```

### Area Graph

```
<%= shiba_area(['my_key_1', 'my_key_2', ...], 
    { 
      title: "My Graph",
      stacked: true
    }, 
    {
      start_time: Time.zone.now-10.minutes, 
      aggregation_period: 1.second
    } 
  ) 
%>
```

### Pie Chart

```
<%= shiba_pie(['my_key_1', 'my_key_2', ...], title: "Pie Chart") %>
```

### Bar Chart

```
<%= shiba_bar(['my_key_1', 'my_key_2', ...] %>
```




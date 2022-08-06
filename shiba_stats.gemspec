Gem::Specification.new do |s|
  s.name        = "shiba_stats"
  s.version     = "0.0.3"
  s.summary     = "ShibaStats"
  s.description = "A small gem for measuring things"
  s.authors     = ["Will DeWind"]
  s.email       = "will.dewind@gmail.com"
  s.files       = Dir['lib/**/*.rb']
  s.homepage    =
    "https://rubygems.org/gems/shiba_stats"
  s.license       = "MIT"
  s.add_runtime_dependency "chartkick"
  s.add_runtime_dependency "redis-time-series"
end

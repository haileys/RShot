Gem::Specification.new do |s|
  s.name        = "rshot"
  s.version     = "0.0.1"
  s.authors     = ["Charlie Somerville"]
  s.files       = Dir["ext/**/*.{c,m,h,rb}"] + ["lib/rshot.rb"]
  s.extensions  = "ext/rshot/extconf.rb"
  s.homepage    = "https://github.com/charliesome/rshot"
end
Gem::Specification.new do |s|
  s.name        = "rshot"
  s.summary     = "Takes screenshots of web pages"
  s.version     = "0.0.4"
  s.authors     = ["Charlie Somerville"]
  s.email       = "charlie@charliesomerville.com"
  s.files       = Dir["ext/**/*.{c,m,h,rb}"] + ["lib/rshot.rb"]
  s.extensions  = "ext/rshot/extconf.rb"
  s.homepage    = "https://github.com/charliesome/RShot"
end

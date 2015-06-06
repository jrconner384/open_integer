Gem::Specification.new do |s|
  s.name        = 'open_integer'
  s.version     = '0.4.0'
  s.date        = DateTime.now
  s.summary     = 'open_integer'
  s.description = 'Various extensions for the Integer class'
  s.authors     = ['Jason Conner']
  s.email       = 'jason.r.conner@gmail.com'
  s.files       = ['lib/open_integer.rb']
  s.homepage    = 'https://github.com/jrconner384/open_integer'
  s.license     = 'MIT'
  s.required_ruby_version = '>=1.9.2'

  s.add_development_dependency 'simplecov', '~> 0.9'
  s.add_development_dependency 'coveralls', '~> 0.8'
  s.add_development_dependency 'minitest', '~> 5'

  s.version = "#{s.version}-pre-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS']
end

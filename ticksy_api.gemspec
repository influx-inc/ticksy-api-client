Gem::Specification.new do |s|
  s.name          = 'Ticksy API Client'
  s.version       = '0.1.0'
  s.license       = 'MIT'
  s.summary       = 'A Ruby client for the Ticksy API https://ticksy.com/'
  s.authors       = ['Michael De Wildt']
  s.email         = 'hello@influx.com'
  s.homepage      = 'https://github.com/influx-inc/ticksy-api-client'
  s.require_paths = ['lib']
  s.files         = [
    'lib/ticksy_api.rb',
    'lib/ticksy_api/client.rb',
    'lib/ticksy_api/error.rb',
    'lib/ticksy_api/ticket.rb',
    'lib/ticksy_api/comment.rb'
  ]
  s.add_runtime_dependency 'rest-client'
end
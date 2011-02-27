Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_dropdown_variants'
  s.version     = '1.0.0'
  s.summary     = 'Spree extension that renders variants as dropdowns instead of radio buttons.'
  s.homepage    = 'http://www.spreecommerce.com'
  s.author      = 'Tim Case'
  s.email       = 'tim@powerupdev.com'
  s.required_ruby_version = '>= 1.8.7'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]  
  s.has_rdoc      = false

  s.add_dependency('spree_core', '>=0.40.3')
end

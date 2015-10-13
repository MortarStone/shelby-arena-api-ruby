Gem::Specification.new do |s|
  PROJECT_GEM = 'shelby-arena-api'
  PROJECT_GEM_VERSION = '0.3.2'

  s.name = PROJECT_GEM
  s.version = PROJECT_GEM_VERSION
  s.platform = Gem::Platform::RUBY

  s.homepage = 'https://github.com/weshays/shelby-arena-api-ruby'
  s.rubyforge_project = 'Project on www.github.com'
  s.authors = ['Wes Hays', 'Jason Hagglund']
  s.email = ['weshays@gbdev.com']

  s.summary = 'Ruby gem/plugin to interact with the Shelby Arena API'
  s.description = 'Ruby gem/plugin to interact with the Shelby Arena API. Checkout the project on github for more detail.'

  s.add_dependency('typhoeus', '0.6.6')
  s.add_dependency('virtus', '1.0.2')


  s.files         = `git ls-files`.split("\n").delete_if { |f| !(f =~ /^examples/).nil? }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

require 'rubygems'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rubygems/specification'
# require 'spec/rake/spectask'
require 'date'
 
GEM = "enlightened_observers"
HUMANIZED_GEM = "EnlightenedObservers"
GEM_VERSION = "1.14.0"
AUTHOR = "ThriveSmart, LLC"
EMAIL = "developers@thrivesmart.com"
HOMEPAGE = "http://www.github.com/moorage/enlightened_observers"
SUMMARY = "Quick and easily share the controller information with observers, including session information."
 
spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.rubyforge_project = GEM
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.textile', 'LICENSE']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  
  # Uncomment this to add a dependency
  # s.add_dependency "foo"
  
  s.require_path = 'lib'
  s.files = %w(LICENSE README.textile Rakefile) + Dir.glob("{lib,spec}/**/*")
end
 
desc "Run Specs"
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end
 
desc "Generate Documentation"
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title = HUMANIZED_GEM
  rdoc.options << '--line-numbers' << '--inline-source' << '--main' << HUMANIZED_GEM
  rdoc.rdoc_files.include(FileList[ 'lib/**/*.rb', 'README.textile', 'LICENSE'])
end
 
task :default => :spec
task :specs => :spec
 
# desc "Run all examples"
# Spec::Rake::SpecTask.new('spec') do |t|
#   t.spec_opts = ['--options','spec/spec.opts']
#   t.spec_files = FileList['spec/**/*.rb']
#   t.rcov = true
# end
 
desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end
 
desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end
 
task :bugs do
  sh %{ditz html ; open html/index.html}
end
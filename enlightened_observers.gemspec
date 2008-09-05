Gem::Specification.new do |s|
  s.name = %q{enlightened_observers}
  s.version = "1.0.20080915"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["ThriveSmart, LLC"]
  s.date = %q{2008-09-05}
  s.description = %q{Quick and easily share the controller information with observers, including session information.}
  s.email = %q{developers@thrivesmart.com}
  s.extra_rdoc_files = ["README.textile", "LICENSE"]
  s.files = ["LICENSE", "README.textile", "Rakefile", "lib/enlightened_observers.rb"]
  s.has_rdoc = false
  s.homepage = %q{http://www.github.com/moorage/enlightened_observers}
  s.require_paths = ["lib"]
  # s.rubyforge_project = %q{enlightened_observers}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Quick and easily share the controller information with observers, including session information.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
    else
    end
  else
  end
end

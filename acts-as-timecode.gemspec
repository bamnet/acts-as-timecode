# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts-as-timecode}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Michalski"]
  s.date = %q{2009-06-03}
  s.description = %q{ActsAsTimecode is a simple pluging to add display a duration as a timecode}
  s.email = %q{tom@mojombo.com}
  s.files = ["init.rb","MIT-LICENSE", "Rakefile", "README", "test/acts_as_timecode_test.rb", "lib/acts_as_timecode.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://vms.brispace.net}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{acts-as-timecode}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{ActsAsTimecode is a simple pluging to add display a duration as a timecode}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 1.15"])
      s.add_runtime_dependency(%q<diff-lcs>, [">= 1.1.2"])
    else
      s.add_dependency(%q<mime-types>, [">= 1.15"])
      s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 1.15"])
    s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
  end
end

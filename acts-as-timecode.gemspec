# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts-as-timecode}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Michalski"]
  s.date = %q{2009-06-03}
  s.description = %q{ActsAsTimecode provides a timecode field, converting a duration to HH:MM:SS:FF}
  s.email = %q{bmichalski@gmail.com}
  s.extra_rdoc_files = [
    "README"
  ]
  s.files = [
    "MIT-LICENSE",
     "README",
     "Rakefile",
     "VERSION",
     "acts-as-timecode.gemspec",
     "init.rb",
     "lib/acts_as_timecode.rb",
     "test/acts_as_timecode_test.rb"
  ]
  s.homepage = %q{http://www.brispace.net}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{ActsAsTimecode provides a timecode field, converting a duration to HH:MM:SS:FF}
  s.test_files = [
    "test/acts_as_timecode_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

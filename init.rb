require 'acts_as_timecode'
ActiveRecord::Base.class_eval { include Acts::Timecode }
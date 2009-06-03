require 'test/unit'
require 'rubygems'
require 'active_record'
 
require "#{File.dirname(__FILE__)}/../init"
 
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
 
def setup_db
  ActiveRecord::Schema.define(:version => 1) do
    create_table :vids do |t|
      t.column :desired, :string
      t.column :duration, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end
end
 
def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end

class Vid < ActiveRecord::Base
end

class TimecodeVid < Vid
  acts_as_timecode :column => :duration
  
  def self.table_name() "vids" end
end

class ActsAsTimecodeTest < Test::Unit::TestCase
  
  def setup
    setup_db
    TimecodeVid.create! :desired => "00:00:00", :duration => 0
    TimecodeVid.create! :desired => "00:01:00", :duration => 60
    TimecodeVid.create! :desired => "00:01:33", :duration => 93
    TimecodeVid.create! :desired => "25:12:59", :duration => 90779
  end
  def teardown
    teardown_db
  end
  
  def test_getting
    assert_equal TimecodeVid.find(1).desired, TimecodeVid.find(1).timecode
    assert_equal TimecodeVid.find(2).desired, TimecodeVid.find(2).timecode
    assert_equal TimecodeVid.find(3).desired, TimecodeVid.find(3).timecode
    assert_equal TimecodeVid.find(4).desired, TimecodeVid.find(4).timecode
  end
  
  def test_setting
    @T2 = TimecodeVid.find(2)
    @T2.timecode = "00:00:00"
    
    assert_not_equal @T2.desired, @T2.duration
    assert_equal @T2.timecode, TimecodeVid.find(1).desired

    @T3 = TimecodeVid.find(3)
    @T3.timecode = "00:60:60"
    @T3.save
    
    assert_equal @T3.timecode, "01:01:00"
    assert_equal @T3.duration, 3660
    
    @T3.timecode = "01:05:15:24"
    #The real value here is 3915.8, but we are working in seconds so we round
    assert_equal @T3.duration, 3916
    
    @T3.timecode = "59:01"
    assert_equal @T3.timecode, "00:59:01"
    assert_equal @T3.duration, 3541
    
    @T3.timecode = "32"
    assert_equal @T3.timecode, "00:00:32"
    assert_equal @T3.duration, 32
    
    
  end
end

# ActsAsTimecode
module Acts
  module Timecode
    def self.included(base)
      base.extend(ClassMethods)
    end
  
    module ClassMethods
      def acts_as_timecode(options = {})
        configuration = {:column => "length", :fps => 30}
        configuration.update(options) if options.is_a?(Hash)
        class_eval <<-EOV
        
          include Acts::Timecode::InstanceMethods
          def timecode_column
            '#{configuration[:column]}'
          end
          def fps
            @fps = '#{configuration[:fps]}'.to_f
          end
          
        EOV
      end
    end
  
    module InstanceMethods
      def timecode
        hours = send(timecode_column).to_i/(60*60).to_i
        rem = send(timecode_column).to_i - hours * (60*60)
        minutes = rem/(60).to_i
        rem = rem - minutes * (60)
        seconds = rem
        @timecode = "#{hours.to_s.rjust(2,'0')}:#{minutes.to_s.rjust(2,'0')}:#{seconds.to_s.rjust(2,'0')}"
      end
 
      def timecode=(value)
        matches = value.split(':')
        matches.map!{|s| s.to_i} 
        case matches.length
        #HH:MM:SS:FF
        when 4
          write_attribute(timecode_column, ((matches[0]*60*60) + (matches[1] * 60) + matches[2] + matches[3]/fps).round)
        #HH:MM:SS
        when 3
          write_attribute(timecode_column, (matches[0]*60*60) + (matches[1] * 60) + matches[2])
        #MM:SS
        when 2
          write_attribute(timecode_column, matches[0] * (60) + matches[1])
        #SS
        else
          write_attribute(timecode_column, value)
        end
      end
    end
  end
end
class ActsAsCsv

  def self.includeed(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_content = []
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(',')
      file.each { |row| @csv_content << row.chomp.split(',') }
    end

    attr_accessor :headers, :csv_content

    def initialize
      read
    end
  end
end

class RubyCsv < ActsAsCsv
  includeed ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_content.inspect

class Row
  attr_accessor :headers, :row

  def initialize headers=[],row=[]
    @headers = headers
    @row = row
  end

  def method_missing(name, *args)
    ## puts "missing:#{name.to_s}=> #{@headers}"
    n = headers.index(name.to_s)
    n && row[n]
  end

end

class ActsAsCsv
  attr_accessor :headers, :csv_content

  def initialize
    @csv_content = []
    read
  end

  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(',')
    file.each { |row| @csv_content << row.chomp.split(',') }
  end

  def each(&block)
    @csv_content.map { |row| Row.new(@headers,row) }
      .each { |v| block.call v }
  end
end

class RubyCsv < ActsAsCsv
end

csv = RubyCsv.new
csv.each { |row| puts row.one }
puts '==='
csv.each { |row| puts row.miss }

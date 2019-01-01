#!/bin/env ruby
# ruby 2d_ruby_grep2.rb sample.txt スウプ

filename=ARGV[0]
search_word=ARGV[1]

file = File.open(filename,'r')
for line,num in file.each_with_index
  puts "#{num+1}:#{line}" if line =~ /#{search_word}/
end

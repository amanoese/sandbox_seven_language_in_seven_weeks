#!/bin/env ruby
# ruby 2d_ruby_grep.rb sample.txt スウプ

filename=ARGV[0]
search_word=ARGV[1]

file = File.open(filename,'r')
num=0
while (line = file.gets) do
  num+=1
  puts "#{num}:#{line}" if line =~ /#{search_word}/
end

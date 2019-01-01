(1..16).each { |num| puts num.to_s + ' : ' + (num..num+3).to_a.to_s }
puts
(1..16*4).each_slice(4) { |arr| puts (arr[0]/4).to_s + ' : ' + arr.to_s }

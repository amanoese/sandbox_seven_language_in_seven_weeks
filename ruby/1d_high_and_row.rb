loop {
  print 'input your number:'
  inNum = gets.to_i
  randNum = rand(10)
  if (inNum < randNum)
     puts "#{inNum} too lower than #{randNum} "
  else
     puts "#{inNum} too upper than #{randNum} "
  end
}

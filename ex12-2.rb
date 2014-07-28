print "How much money will you give me? "
money = gets.chomp.to_f
change = money / 10
puts "You get #{change} back"


module Room2

	def Room2.door_room

	  Text.dialog(4)
	  puts "You are in a dark room."
	  puts "There is a door to your right and left."
	  puts "Which one do you take?"

	  print "> "
	  choice = $stdin.gets.chomp

	  if choice == "left"
		mummy_room
	  elsif choice == "right"
		cthulhu_room
	  else
		dead("You stumble around the room until you starve.")
	  end
	
end

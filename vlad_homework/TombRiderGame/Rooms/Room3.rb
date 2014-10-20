
module Room2

	def Room2.mummy_room

	  Text.dialog(4)
	  Text.dialog(5)
	  Text.dialog(6)
	  Text.dialog(7)
	  
	  while true
		print "> "
		choice = $stdin.gets.chomp

		if choice == "take honey"
		  dead("The bear looks at you then slaps your face off.")
		elsif choice == "taunt bear" && !bear_moved
		  puts "The bear has moved from the door. You can go through it now."
		  bear_moved = true
		elsif choice == "taunt bear" && bear_moved
		  dead("The bear gets pissed off and chews your leg off.")
		elsif choice == "open door" && bear_moved
		  gold_room
		else
		  puts "I got no idea what that means."
		end
	  end
	end
	
end

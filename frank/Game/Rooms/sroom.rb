require "./Rooms/croom.rb"
require "./Rooms/proom.rb"
module InitGame

 def InitGame.begingame

    puts "You are in a dark room."
    puts "There is a door to your right and left."
    puts "Which one do you take?"

    print "> "
    choice = $stdin.gets.chomp

    if choice == "left"
      PRoom.room
    elsif choice == "right"
      CRoom.room
    else
      ERoom.dead("You stumble around the room until you starve.")
    end
  end
end
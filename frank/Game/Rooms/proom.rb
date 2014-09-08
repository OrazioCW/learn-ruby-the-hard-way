require "./Rooms/groom.rb"
require "./Rooms/eroom.rb"
module PRoom
  def self.room
    puts "There is a pissfeet here."
    puts "The pissfeet has a bunch of honey."
    puts "The fat pissfeet is in front of another door."
    puts "How are you going to move the pissfeet?"
    pissfeet_moved = false

    while true
      print "> "
      choice = $stdin.gets.chomp

      if choice == "take honey"
        ERoom.dead("The pissfeet looks at you then slaps your face off.")
      elsif choice == "taunt pissfeet" && !pissfeet_moved
        puts "The pissfeet has moved from the door. You can go through it now."
        pissfeet_moved = true
      elsif choice == "taunt pissfeet" && pissfeet_moved
        Eroom.dead("The pissfeet gets pissed off and chews your leg off.")
      elsif choice == "open door" && pissfeet_moved
        GRoom.room
      else
        puts "I got no idea what that means."
      end
    end
  end
end
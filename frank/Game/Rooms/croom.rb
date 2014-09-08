require "./Rooms/eroom.rb"
module CRoom
  def CRoom.room
    puts "Here you see the great evil Cthulhu."
    puts "He, it, whatever stares at you and you go insane."
    puts "Do you flee for your life or eat your head?"

    print "> "
    choice = $stdin.gets.chomp

    if choice.include? "flee"
      InitGame.begingame
    elsif choice.include? "head"
      ERoom.dead("Well that was tasty!")
    else
      room
    end
  end
end
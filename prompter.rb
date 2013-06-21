require_relative 'chorder'




qualities = ["M7","m7","7","M7#5","m7b5","7#5","7b5","mM7","d"]
roots = ["A","B","C","D","E","F","G"]

loop do
  system ("clear") 
  puts "The Chorder - By Jeff Fowler"
  puts
  puts "Enter information as prompted, hit enter to randomize." 
  puts
  puts "To exit the program, press Ctrl-C"
  puts "All of the voicings are accurate, though sometimes the enharmonic spellings get wonky. You may have to transpose a note or two up or down an octave if the voicing straddles the 12th fret."
  puts
  puts "Hit Enter to start!"
  gets

 system ("clear")
  puts
  puts "What root note?"
  puts "--------------------"
  x = gets.chomp 
  if x == ""
    x = roots[rand(7)]
  end
  puts
  puts"What chord quality?"
  puts "--------------------"
  puts "M7 = Major Seventh"
  puts "m7 = Minor Seventh"
  puts "7 = Dominant Seventh"
  puts "m7b5 = Minor Seventh Flat Five"
  puts "mM7 = Minor Major Seventh"
  puts "M7#5 = Major Seventh Sharp Five"
  puts "d = Fully Diminished Seventh Chord"
  puts  
  xtwo = gets.chomp
  if xtwo == ""
    xtwo = qualities[rand(8)]
  end 
  puts
  puts "What inversion?"
  puts "--------------------"
  puts "0 = Root position"
  puts "1 = First Inversion"
  puts "2 = Second Inversion"
  puts "3 = Third Inversion"
  puts
  y = gets.chomp
  if y == ""
    y = rand(4)
  end
  puts "Which string set?"
  puts "--------------------"
  puts "1 = D, G, B, High E"
  puts "2 = A, D, G, B"
  puts "3 = Low E, A, D, G"
  puts
  z = gets.chomp
  if z == ""
    z = rand(1..3)
  end
  system ("clear")

  puts x.to_s + xtwo.to_s
  puts "#{y} inversion"
  puts 
  puts printer(x.to_s + xtwo.to_s,y.to_s,z.to_s)
  gets
end


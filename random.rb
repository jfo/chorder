require_relative 'chorder'

qualities = ["M7","m7","7","M7#5","m7b5","7#5","7b5","mM7","d"]
roots = ["A","B","C","D","E","F","G","A#","B#","C#","D#","E#","F#","G#","Ab","Bb","Cb","Db","Eb","Fb","Gb"]


loop do
  system ("clear")
  x = roots[rand(7)]
  xtwo = qualities[rand(8)]
  y = rand(4)
  z = rand(1..3)
  puts printer(x.to_s + xtwo.to_s,y.to_s,z.to_s)
  puts
  puts x+xtwo
  puts "#{y} inversion"
  sleep 0.5
end



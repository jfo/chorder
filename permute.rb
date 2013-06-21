require_relative 'chorder.rb'

roots = ["A","B","C","D","E","F","G"]
acc = ["","#","b"]
allroots = []

roots.each do |flerk|
  i=0
  until i== acc.length
    allroots << flerk + acc[i]
    i+=1
  end
end


qualities = ["m7","M7","7","m7b5","M7#5","M7b5","7#5","7b5","Mm7"]

chords = []
allroots.each do |flerk|
  i=0
  until i== qualities.length
    chords << flerk + qualities[i]
    i+=1
  end
end

p chords
gets

loop do
chords.each do |flark|
  puts printer(flark)
  #sleep 0.1
end
end

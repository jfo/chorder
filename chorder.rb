def chorder(x)
  notes = ["A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab"]
  notessharp = ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#"]

  blerp = x.split(//)
  blerp[0] = blerp[0].upcase

  if blerp[1] == "b" || blerp[1] == "#"
    blerp[0] = blerp[0] + blerp[1]
    blerp.delete_at(1)
  end
  if blerp[0][1] == "#"
    blerp.each {|flark| flark = switch(flark)} 
  end
  if blerp[0] == "Cb"
    blerp[0] = "B" 
  end
  if blerp[0] == "B#"
    blerp[0] = "C" 
  end
  if blerp[0] == "E#"
    blerp[0] = "F" 
  end
  if blerp[0] == "Fb"
    blerp[0] = "E" 
  end
   

#
#  if blerp.include?("7") == false 
#    triad = "yes"
#  end
#
  blerp.insert(1,"dom") if blerp[1] == "7" 
  if blerp[0][1] == "#"
    rootindex = notes.index(switch(blerp[0]))
  else
    rootindex = notes.index(blerp[0])
  end

  if blerp[1] == "M"
    third = notes[(rootindex+4)%12]
    fifth = notes[(rootindex+7)%12] 
    seventh = notes[(rootindex+11)%12]
  elsif blerp[1] == "m" && blerp[2] == "M"
    third = notes[(rootindex+3)%12]
    fifth = notes[(rootindex+7)%12] 
    seventh = notes[(rootindex+11)%12]
  elsif blerp[1] == "m"
    third = notes[(rootindex+3)%12]
    fifth = notes[(rootindex+7)%12] 
    seventh = notes[(rootindex+10)%12]
  elsif blerp[1] == "dom"
    third = notes[(rootindex+4)%12]
    fifth = notes[(rootindex+7)%12] 
    seventh = notes[(rootindex+10)%12]
  elsif blerp[1] = "d"
    third = notes[(rootindex+3)%12]
    fifth = notes[(rootindex+6)%12] 
    seventh = notes[(rootindex+9)%12]
  end

  if blerp[3] == "b" 
    fifth = notes[(rootindex+6)%12] 
  end
  if blerp[3] == "#"
    fifth = notes[(rootindex+8)%12]
  end
  chord = [blerp[0], third, fifth, seventh]
end

def check(array) 
  naturals = ["A","B","C","D","E","F","G"]
  testarray = array.map {|nark| nark = nark[0] }
  switchhash = {"A"=>"A", "B"=>"B", "C"=>"C","D"=>"D", "E"=>"E","F"=>"F", "G"=>"G","D#" => "Eb","Ab"=>"G#","Gb"=>"F#","Eb"=>"D#","Db"=>"C#","Bb"=>"A#","A#"=>"Bb","G#"=>"Ab","E#"=>"F","D#"=>"Eb","B#"=>"C","C#"=>"Db","F#" => "Gb","Cb"=>"B", "Fb" => "E"}
   
  iroot = naturals.index(testarray[0])
  ithird = (iroot + 2)%7 
  ififth = (iroot + 4)%7
  iseventh = (iroot + 6)%7 

  checkroot = naturals[iroot] 
  checkthird = naturals[ithird] 
  checkfifth = naturals[ififth] 
  checkseventh = naturals[iseventh]

  root = testarray[0]
  third = testarray[1]
  fifth = testarray[2]
  seventh = testarray[3]

  if checkroot != root || checkthird != third || checkfifth != fifth || checkseventh != seventh
    array[1..-1] = array[1..-1].map! {|flerg| flerg = switchhash[flerg]} 
  end

  return array
end

def switch(note)
  switchhash = {"A"=>"A", "B"=>"B", "C"=>"C","D"=>"D", "E"=>"E","F"=>"F", "G"=>"G","D#" => "Eb","Ab"=>"G#","Gb"=>"F#","Eb"=>"D#","Db"=>"C#","Bb"=>"A#","A#"=>"Bb","G#"=>"Ab","E#"=>"F","D#"=>"Eb","B#"=>"C","C#"=>"Db","F#" => "Gb","Cb"=>"B", "Fb" => "E"}
   
  note = switchhash[note]
end

def spread?(array)
    lowest = 12
    highest = 0
    array.each do |splat|
      splat[1..-2].each do |insplat|
        if insplat != "|---" && splat.index(insplat) > highest
          highest = splat.index(insplat)
        end
        if insplat != "|---" && splat.index(insplat) < lowest
          lowest = splat.index(insplat)
        end 
      end
    end
    if highest-lowest > 5
      return true
    end
end
 
def printer(chord, inv="", set="")
  if chord.is_a?(String)
    chord = chorder(chord) 
  end
  chord = check(chord)
#inverts the chord 
  if inv != "" || inv == nil 
    inv.to_i.times do
      chord = chord.push(chord.shift) #takes the first element and appends it to the end
    end
  end

#this bit makes it into a drop 2 voicing
  chord.push(chord.shift) 
  chord.push(chord.shift)
  chord.unshift(chord[2])
  chord.delete_at(3)

  
  frets = [" ","  1 ","  2 ","  3 ","  4 ","  5 ","  6 ","  7 ","  8 ","  9 "," 10 "," 11 "," 12 "," "]
  e = ["| ","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|"]

  b = ["| ","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|"]
  g = ["| ","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|"]
  d = ["| ","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|"]
  a = ["| ","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|"]
  lowe = ["| ","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|---","|"]
  
  enotes = {"F"=>1,"F#"=> 2, "Gb"=> 2, "G" => 3, "G#" => 4, "Ab" => 4, "A" =>5, "A#" => 6, "Bb" => 6, "B" =>7, "C" => 8, "C#" => 9, "Db" => 9, "D" => 10, "D#" => 11, "Eb" => 11, "E"=> 12}
  bnotes = {"C"=>1,"C#"=> 2, "Db"=> 2, "D" => 3, "D#" => 4, "Eb" => 4, "E" => 5, "F" => 6, "F#" => 7, "Gb" => 7, "G" => 8, "G#" => 9, "Ab" => 9, "A" => 10, "A#" => 11, "Bb" => 11, "B"=> 12}
  gnotes = {"G#"=>1,"Ab"=> 1, "A"=> 2, "A#" => 3, "Bb" => 3, "B" => 4, "C" => 5, "C#" => 6, "Db" => 6, "D" => 7, "D#" => 8, "Eb" =>8, "E" => 9, "F" => 10, "F#" => 11, "Gb" => 11, "G"=> 12}
  dnotes = {"D#"=>1,"Eb"=> 1, "E"=> 2, "F" => 3, "F#" => 4, "Gb" => 4, "G" => 5, "G#" => 6, "Ab" => 6, "A" => 7, "A#" => 8, "Bb" => 8, "B" => 9, "C" => 10, "C#" => 11, "Db" => 11, "D"=> 12}
  anotes = {"A#"=>1,"Bb"=> 1, "B"=> 2, "C" => 3, "C#" => 4, "Db" => 4, "D" => 5, "D#" => 6, "Eb" => 6, "E" => 7, "F" => 8, "F#" => 9, "Gb" => 9, "G" => 10, "G#" => 11, "Ab" => 12, "A"=> 12}
  lowenotes = {"F"=>1,"F#"=> 2, "Gb"=> 2, "G" => 3, "G#" => 4, "Ab" => 4, "A" => 5, "A#" => 6, "Bb" => 6, "B" => 7, "C" => 8, "C#" => 9, "Db" => 9, "D" => 10, "D#" => 11, "Eb" => 12, "E"=> 12}


  if set == "" || set == "1"
  e[enotes[chord[3]]] = "|-#{chord[3]}-"
  b[bnotes[chord[2]]] = "|-#{chord[2]}-"
  g[gnotes[chord[1]]] = "|-#{chord[1]}-"
  d[dnotes[chord[0]]] = "|-#{chord[0]}-"
  
  elsif set == "2"
  b[bnotes[chord[3]]] = "|-#{chord[3]}-"
  g[gnotes[chord[2]]] = "|-#{chord[2]}-"
  d[dnotes[chord[1]]] = "|-#{chord[1]}-"
  a[anotes[chord[0]]] = "|-#{chord[0]}-"

  elsif set == "3"
  g[gnotes[chord[3]]] = "|-#{chord[3]}-"
  d[dnotes[chord[2]]] = "|-#{chord[2]}-"
  a[anotes[chord[1]]] = "|-#{chord[1]}-"
  lowe[lowenotes[chord[0]]] = "|-#{chord[0]}-"
  end  
  
  fretboard = [e,b,g,d,a,lowe]
  fretnotes = [lowenotes, anotes, dnotes, gnotes, bnotes, enotes]

#Clips extra "-" from end of non-natural root notes
  fretboard.each do |glerk|
    glerk.map! do |inglerk|
      if inglerk.length > 4 
         inglerk = inglerk[0..-2] 
      else
        inglerk = inglerk
      end
    end
  end
 
  oldfretboard = fretboard 
   
  if spread?(fretboard) 
    one = true 
    fretboard.each do |glerb|
      if glerb[12] != "|---"
        glerb[0] = "|#{glerb[12][2]}" 
        glerb[12] = "|---"
      end
    end
  end

  if one == true && spread?(fretboard) 
     fretboard.each do |flerb|
       last = flerb.pop
       3.times {flerb << "|---"}
       flerb.push(last)
       flerb[13] = flerb[1]
       flerb[14] = flerb[2]
       flerb[15]= flerb[3]
       if flerb[0] != "| "
         flerb[12] = "|-#{flerb[0][1]}-"
       end
       flerb[0] = "| "
       flerb[1] = "|---"
       flerb[2] = "|---"
       flerb[3] = "|---"
     end
       frets << "13  "
       frets << "14  "
       frets << "15  "
  end

  fretboard.collect! {|flerk| flerk = flerk.join}
  puts frets.join
  fretboard.join("\n")
end

This is a program that generates fretboard diagrams for any inversion of any seventh chord on any one of four contiguous stringsets. 

The voicings are all in a Drop 2 voicing: 
http://en.wikipedia.org/wiki/Block_chord

The logic lives in chorder.rb, and there are several ways to interact with it: 

prompter.rb is a simple terminal interface that asks a series of questions to generate an ASCII fretboard, 

random.rb will simply display random voicings at interval,

and shoeschorder.rb is a rudimentary GUI developed with Shoes 3. It is functional and will work on OS X. Unfortunately Shoes' package bundler crashes pretty hardcore, so you'll have to download and run the shoes interpreter to use it that way.  

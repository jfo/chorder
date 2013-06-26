This is a program that generates fretboard diagrams for any inversion of any seventh chord on any one of four contiguous stringsets. 

The voicings are all in a Drop 2 voicing: 
http://en.wikipedia.org/wiki/Block_chord

The logic lives in chorder.rb, and there are several ways to interact with it: 

prompter.rb is a simple terminal interface that asks a series of questions to generate an ASCII fretboard, 

random.rb will simply display random voicings at interval,

and shoeschorder.rb is a rudimentary GUI developed with Shoes 3. It is functional and will work on OS X. Unfortunately Shoes' package bundler crashes pretty hardcore, so you'll have to download and run the shoes interpreter to use it that way. You can get that here: http://shoesrb.com/downloads.html

More info:

The seventh chords that are used are derived from all the possible indigenous seventh chords in all four primary seven toned scales that have neither consecutive halfsteps nor more than one augmented 2nd:

Major

Melodic Minor

Harmonic Minor

Harmonic Major

"Indigenous" means that they can be built out of strictly thirds starting on a scale degree.

The app can actually accommodate any chord with a b5 or #5, but I have left these out of the options to simplify things for now.

Definitely try to play some of them on an instrument if possible! The first inversion chords on the highest string set are particularly colorful!



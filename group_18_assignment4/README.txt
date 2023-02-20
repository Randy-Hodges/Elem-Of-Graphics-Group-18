There are two main ways to run our program. The first (the way without sound), is to simply open the assignment folder and run the project. 
The other way (with sound) is to download the sound library from the processing app by going to sketch -> import library -> add library and selecting 
the sound library. After that, uncomment the following lines that are located in group_18_assignment4.pde and run the file. Clicking the mouse will 
create a honking sound:

At the top of the file:
// import processing.sound.*; // make sure you first download the Processing Sound library
// SoundFile carHorn; // "Small car horn" from mixkit.co
// carHorn = new SoundFile(this, "audio/mixkit-small-car-horn-717.wav");

Under "mousePressed()" near the bottom of the file:
//   carHorn.play();
//   carHorn.amp(.5);
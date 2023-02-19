There are two main ways to run our program. The first (the way without sound), is to simply open the assignment folder and run the project. 
The other way (with sound) is to first download the sound.zip file and extract it to the "libraries" folder where your processing is installed.
After that, uncomment the following lines that are located in group_18_assignment4.pde and run the file. Clicking the mouse will create a honking
sound:

// import processing.sound.*; // make sure you first download the Processing Sound library
// SoundFile carHorn; // "Small car horn" from mixkit.co
// carHorn = new SoundFile(this, "audio/mixkit-small-car-horn-717.wav");
Under "mousePressed()"
//   carHorn.play();
//   carHorn.amp(.5);
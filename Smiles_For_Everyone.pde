//UP HERE WE DECLARE AND INITIALIZE GLOBAL VARIABLES
float smileX, smileY; // declare variables
color faceColor; // declare variables to hold color(s)
color eyeColor;
color strokeColor;
SmileyFace head; // did I declare a new instance of SmileyFace?
SmileyFace crashTestDummy;
SmileyFace [] faces = new SmileyFace [32]; // declare an array of 32 smiley faces

//SETUP IS WHERE WE DO SOME INITIALIZATING of ENVIRONMENT
void setup(){
  size(1024,512); // size of our canvas in pixels
  smileX = 255; // set initial value
  smileY = 255; // set initial value
  head = new SmileyFace(255,128);
  crashTestDummy = new SmileyFace(); // invoke default
  for (int i = 0; i < faces.length; i++){
    faces [i] = new SmileyFace (random(width), random(height)); // initialize new SmileyFace at a random location
  }

}


void draw(){
 
  if (smileX > 250 && smileX < 260 && // will make background pink
      smileY > 250 && smileY < 260){
    background(255,170,238); // the color combo for FAE a pink
  } else {
  background(255);// sets color of our canvas to white
  }
  // let's make a smiley face
  fill(255); // fill petals with white
  stroke(0); // stroke color will be black
  strokeWeight(8); // set stroke weight in pixels
  for (int theta = 0; theta <= 360; theta += 30){
    float tempx = smileX + (128*cos(radians(theta)));
    float tempy = smileY + (128*sin(radians(theta)));
    ellipse(tempx, tempy, 64,64);
  }
  
  fill(245,220,66); // fill the next shape with yellow
  stroke(0); // the color of the stroke will be black
  strokeWeight(16); // set the weight in pixels
  ellipse (smileX,smileY, 255,255); // create a circle in center of composition
  fill(255); // fill the next shape with white
  strokeWeight(8); // set the stroke weight
  ellipse (smileX-35,smileY-35, 32,64); // draw an ellipse for the left eye
  ellipse (smileX+35,smileY-35, 32,64); // draw an ellipse for the right eye
  arc(smileX,smileY+20, 128, 96, 0, PI, CHORD); // trail and error to get the radians to work
  
  for (int i = 0; i < faces.length; i++){
    faces[i].updateFace();
    faces[i].drawFace();
  }
  head.updateFace();
  head.drawFace();
  crashTestDummy.drawFace(); // built with default constructor
  
  smileX = mouseX; // change to mouse X location each frame
  smileY = mouseY; // change to mouse Y location each frame
}

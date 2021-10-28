class SmileyFace { // declare and define a class
  // declare member variables here
  float currentX; // declare member variable X
  float currentY;
  float velocityX = 1; // declare and initialize a rate of change in X
  float velocityY = 1; // declare and initialize a rate of change in Y
  color currentFaceColor; // declare member variables for color(s)
  color currentEyeColor;
  color currentStrokeColor;
  
  // declare a default Constructor to initialize
  // a default SmileyFace
  SmileyFace() {
    currentX = 128; // initialize member variable
    currentY = 128;
    currentFaceColor = color(245,220,66); // initialize
    currentEyeColor = color(255,255,255);
    currentStrokeColor = color(0,0,0);
  } // end define default contructor
  
  // declare a constructor that receives arguments/parameters
  SmileyFace(float inboundX, float inboundY){
    currentX = inboundX;
    currentY = inboundY;
    currentFaceColor = color(245,220,66); // initialize
    currentEyeColor = color(255,255,255);
    currentStrokeColor = color(0,0,0);
    //velocityX = random(-1,1);
    //velocityY = random(-1,1);
  }
  
  void updateFace(){ // the method will update SmileyFace and be called from draw loop in main
      if (currentX > width || 
          currentX < 0 ){
            velocityX = velocityX * -1; // velocity initialized above as a member variable
          }
      if (currentY > height ||
          currentY < 0){
            velocityY = velocityY * -1;
          }
      currentX = currentX + velocityX;
      currentY = currentY + velocityY;
      //currentStrokeColor = color(random(128));
  }
  void drawFace(){ // this method will draw SmileyFace and be called from draw loop in main
    fill(currentFaceColor); // defines the color of the face
    stroke(currentStrokeColor); // defines the color of the stroke
    strokeWeight(8); // defines the thickness of the stroke or outline
    ellipse(currentX, currentY, 64, 64); // draw the smiley face
    fill(currentEyeColor); // define the eye color
    strokeWeight(4); //
    ellipse(currentX-9, currentY-9, 8, 16);// left eye
    ellipse(currentX+9, currentY-9, 8, 16);// right eye
    arc(currentX, currentY+5, 32, 24, 0, PI, CHORD); //smile
  }
  
} // end definition of a class

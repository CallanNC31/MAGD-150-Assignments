void setup(){
  background(120); //gave it a background
  size(200, 200);// required size is 128 by 128 pixels can be bigger
  
}

void draw() {
  stroke(0);//outlines everything
  strokeWeight(1);// so it doesn't mess up my other weights
  
  rect(120,120,50,100);// First rect, first building
  
  fill(175);//make the building a different color then the first
  rect(20,100,50,120);// second rect, second building
  noFill();//so it doesn't fill everything with this color

  ellipse(145,145,30,30);//clock
  
  noStroke();//so the moon doesn't get the outline
  fill(255);//full moon so its white
  ellipse(25,25,50,50);//this is the moon, its a full moon
  noFill();//so it doesn't fill everything else
  
  stroke(0);//brings the stroke back since I used noStroke
  point(145,145);//center of the clock
  
  line(145,145,140,135);//the moving hand on the clock
  
  line(145,145,145,130);//facing the 12 on a clock, should be saying its 11:00pm
  
  stroke(20);//for the door on the building
  strokeWeight(2);//so I can use stroke cap
  strokeCap(SQUARE);//now its a square door
  rect(40,180,10,200);//the door into one building
  noStroke();//so it doesnt mess up my other strokes
  
  stroke(0);//to color a the point
  strokeCap(ROUND);//to see the door knob
  point(47,190);//the door knob
  noStroke();//so nothing else uses this stroke
  
  stroke(0);//to be able to see the different floors
  strokeWeight(1);//if I dont have this it uses the other stroke weight
  fill(220);//to make it look like glass
  rect(20,160,50,15);//these are the different floors, and its glass
  rect(20,140,50,15);
  rect(20,120,50,15);
  rect(20,100,50,15);
  noFill();// so it doesn't mess with any other fills or anything
   
}
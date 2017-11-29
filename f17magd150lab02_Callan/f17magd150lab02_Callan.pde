void setup(){
  size(600,600);// so I can make it look like a solar system
  colorMode(RGB,50,150,200);//one color thing out of 3
  
}

void draw(){
  background(0);//makes it look like outerspace
  
  noStroke();//this "planet" won't have a outer ring
  fill(255,100,100);//fill the planet with color
  arc(100,100,120,120,0,TWO_PI);//full cirlce, a planet
  
  noFill();//so it doesn't mess with other fills and colormodes
  
  colorMode(HSB,200,200,50);//2nd color thing out of 3
  fill(100,90,200);//give the planet color
  arc(300,300,120,120,0,TWO_PI);//another plant
  
  fill(150,125,200);//give the rocket ship color
  triangle(50,400,50,350,120,375);//rocket ship flying through space
  
  noFill();//so it doesn't mess with other colors and fills
  
  hex(230,25);//used hex instead of color mode because the colormode kept messing up
  //the other color modes and they would turn black, so I looked this up on the
  //tutorial page on processing.org and I used this, hopefully this still works
  //for the assignment
  stroke(200,150,100);//gives the bezier/"comet" color
  bezier(300,400,200,350,50,300,500,420);//this is the "comet"
  noStroke();//so it doesn't mess with other strokes or anything else
  
}
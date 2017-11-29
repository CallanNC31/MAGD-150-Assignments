int pX, pY, sX, sY;
color c;
float x=400;
float y=300;
float w=200;
float h=150;

void setup(){
  size(600,600);
  pX=30;
  pY=35;
  sX=20;
  sY=20;
  frameRate(1000000);/*gives it the tv feel*/
  //gives the int values//
}

void draw(){
  randomPosition();
  colorGreyShade();
  displayRect();
  buttonsRect();
  buttonsEllipse();
  TextButton();
}

void randomPosition(){
  pX= round(random(width));
  pY= round(random(height));
}

void colorGreyShade(){
  c=round(random(255));
}

void displayRect(){
  fill(c);
  rect(pX,pY,sX,sY);
}
/*all this gives this the tv feel when a tv can't find service to anything*/
void buttonsRect(){
  if (mousePressed){
    rect(x,y,w,h);
    fill(255);
    if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
      println("The mouse is pressed and over the button");
      fill(0);
      //make the screen go from black and white
      /*makes the tv look like its breaking with a bigger portion breaking and
      changing colors*/
    }
  }
}

void buttonsEllipse(){
  if (mousePressed){
    ellipse(x,y,w,h);
    if(mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h){
      println("The mouse is pressed and over the circle button");
      fill(c);
      //make the circle go from black and white
      /*makes it look like your tv is breaking with a bigger portion breaking*/
    }
  }
}

void TextButton(){
  noFill();
  textSize(28);
  fill(0,200,87);
  text("Breaking",450,400);
  fill(0,200,87);
  text("Circle Breaking",300,300);
}
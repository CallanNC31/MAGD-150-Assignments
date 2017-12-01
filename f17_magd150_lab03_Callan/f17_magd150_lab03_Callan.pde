void setup(){
  size(400,400);
  background(100,200,10);
}

void draw(){
  
  char c;
  float f=constrain(mouseX,30,70);//doesn't like float f get below 30 or higher then 70
  int i = max(3,10);//sets i to 10
  int j = min(2,12);//sets j to 2
  
  
  c='A';
  f=float(c+=50);
  i=int(f*2);
  
  println(f); //should say f is 115.0
  println(i);// should say I is 230
  
   if (mousePressed){//if I press the mouse its one color
    fill(0,100,140);//gives this rect color
    rect(mouseX,mouseY,i/=2,30);//lets me move the mouse around and make rects
  }
  else{//when I dont press the mouse its the other color
  fill(0,200,170);//gives this rect color
 rect(mouseX,mouseY,f-=2,j);//lets me move the mouse around and makes rects
  }
  frameRate(60);//60 fps is default anyway but I want it like this.
  println(frameCount);//counts the frames... cool to see though
  
  line(mouseX,20,pmouseX,80);
  line(mouseX,50,pmouseX,120);//had to use processor to help me out with this pmouseX
  println(mouseX + " : " + pmouseX);//this is actually pretty cool
  /*I have used all the required pieces, 3 functions listed at the top, 4 math
  operators or comparisons, and I have used at least 4 of the Prcessing key words.*/
  

}
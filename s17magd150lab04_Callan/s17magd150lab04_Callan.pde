int press=0;
int pressState=0;
int value=0;
int anotherslice=0;


void setup(){
  size(600,600);
  
}

void draw(){
    background(0,0,100);
    
  fill(255,0,0);
  
  triangle(mouseX,mouseY,mouseX+100,mouseY-100,mouseX+100,mouseY+100);/*lets the
  first trianlge/pizza move on its own*/
  
  fill(255,0,0);
  
  if (keyPressed==true){//second if statement
  
    fill(value);
    
    triangle(350,300,100,325,400,450);//first pizza
  }
  if (pressState==1){//first if statement
  
    fill(255,0,0);//red pizza 
    
    triangle(100,0,150,250,100,200);//second pizza
  }
  while (anotherslice<80){//while loop
    triangle(350,anotherslice,400,anotherslice,200,anotherslice);/*another
    slice of pizza or another triangle*/
    anotherslice=anotherslice+1;
    println(anotherslice);
  }
}

void mousePressed(){
  press=press+1;
  pressState=(press%2);
}

void keyPressed(){
  if (value==0){//third if statement
    value=255;
  } else {
    value=0;//makes the pizza/triangles different colors
  }
}
  
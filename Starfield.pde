class Particle{
  double myX, myY, myAngle, mySpeed;
  int myColor, myHeight, myWidth;
  Particle(){
    myX = 250;
    myY = 250;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*6+1;
    myColor = color((int)(Math.random()*55+200),(int)(Math.random()*55+200),(int)(Math.random()*55+200));
    myHeight = 8;
    myWidth = 6;
  }
  void show(){
    fill(myColor);
    ellipse((float)myX, (float)myY, myWidth, myHeight);
    ellipse((float)myX,((float)myY)-10, myWidth, myHeight);
    ellipse(((float)myX)+5,((float)myY)-5, myHeight, myWidth);
    ellipse(((float)myX)-5,((float)myY)-5, myHeight, myWidth);
  }
  void move(){
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
    if(myX < -10 || myX > 510 || myY < -10 || myY > 510){
    myX = myY = 250;
    }
  }
}

class notParticle extends Particle{
  notParticle(){
    myX = 250;
    myY = 250;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*5+1;
    myColor = color((int)(Math.random()*200+55),(int)(Math.random()*200+55),(int)(Math.random()*200+55));
    myHeight = 20;
    myWidth = 15;
  }
}
Particle[] blob = new Particle[100];

void setup(){
  size(500,500);
  noStroke();
  for(int i = 0; i < 10; i++){
    blob[i] = new notParticle();
  }
  for(int i = 10; i < blob.length; i++){
    blob[i] = new Particle();
  }
}

void draw(){
  fill(0, 0, 0, 60);
  rect(0, 0, 500, 500);
  for(int i = 0; i < blob.length; i++){
    blob[i].move();
    blob[i].show();
    }
  }

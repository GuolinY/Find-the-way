//need to return dot back to its original speed after it is no touching edge

class Dot{
  boolean[] keys = new boolean[128];
  boolean moving = false;
  boolean end = false;
  boolean edgePointCollision = false;
  PVector location = new PVector(spacing/2,spacing/2), acc, vel = new PVector(0,0),distanceDotToLine;
  float radius=20;//spacing*0.35;
  float t;
  Dot(){
     acc = new PVector(bt.pathLength/h,bt.pathLength/h);
  }

  void move(){
    println(bt.pathLength/h);
    //check if at finish
    finished();
    
    vel.x*=0.95;
    vel.y*=0.95;
    
    //if at end or time is paused, stop
    if(end || !sw.running){
      moving=false;
      vel.x=0;
      vel.y=0;
    }
    else{//if not at end then....
      
      if(keys['s']||keys['S']){
        vel.y+=acc.y;
      }
      if(keys['d']||keys['D']){
        vel.x+=acc.x;
      }
      if(keys['w']||keys['W']){
        vel.y-=acc.x;
      }
      if(keys['a']||keys['A']){
        vel.x-=acc.x;
      }
      
      vel.limit(4);
      for(int i=0;i<test.edges.size();i++){//now make it so that it detects two edges at the same time - the max amount of edges
        //following if statemnet maybe useless so delete if needed
        distanceDotToLine = new PVector(location.x-(test.edges.get(i).points[0]+test.edges.get(i).points[2])/2,location.y-(test.edges.get(i).points[1]+test.edges.get(i).points[3])/2);
        if(distanceDotToLine.mag()-10<spacing/2){
          circleLineCollision(i);
        }
      }
      
      location.x+=vel.x;
      location.y+=vel.y;
      
      
    }
      
    
    strokeWeight(0);
    fill(#ff00ff);
    ellipse(location.x,location.y,radius,radius);
        
  }
  
  void circleLineCollision(int i){
    PVector A,A2,B,C,d;
    A = new PVector(location.x-test.edges.get(i).points[0],location.y-test.edges.get(i).points[1]); //start of line to location
    A2 = new PVector(location.x-test.edges.get(i).points[2],location.y-test.edges.get(i).points[3]); //end of line to location
    d = new PVector(test.edges.get(i).points[2]-test.edges.get(i).points[0],test.edges.get(i).points[3]-test.edges.get(i).points[1]); //vector from start to end of the line
    
    float x = (d.dot(A))/(d.dot(d));
    B = new PVector(x*d.x,x*d.y);//
    
    C = new PVector(-B.x+A.x,-B.y+A.y);
    
    ////Testing to see where dot is going to hit the edge
    //stroke(255);
    //ellipse(test.edges.get(i).points[0]+B.x,test.edges.get(i).points[1]+B.y,2,2);
    
    if((A.mag()<=radius+4 && A2.mag()<=spacing+radius+4) || (A2.mag()<=radius+4 && A.mag()<=spacing+radius+4)){
      //float angle = new PVector.angleBetween(d,A);
      edgePointCollision = true;
      bounce(i);
    }
    //if(A.mag()<spacing && A2.mag()<spacing && B.dot(C)==0){
    if(C.mag()<=radius){//if perpendicular distance from dot to edge is equal to the radius
      bounce(i);
    }
    
  }
  
  void bounce(int i){    
    if(edgePointCollision){
      if(test.edges.get(i).points[0]==test.edges.get(i).points[2]){//vertical edge
        vel.y=-1.5*vel.y;
      }
      else{
        vel.x=-1.5*vel.x;
      }
      edgePointCollision = false;
    }
    else{
      if(test.edges.get(i).points[0]==test.edges.get(i).points[2]){//vertical
        vel.x=-1.5*vel.x;
      }
      else{//horizontal 
        vel.y=-1.5*vel.y;
      }
    }
    println("Collision: "+vel);
  }
  
  void finished(){
    //if x or y coordinates of dot are the same or greater than upper left hand corner stop movement.
    if(location.x>=height-spacing+15 && location.y>=height-spacing+15 && location.x<height && location.y<height){
      
      end = true;//set dot at end
      moving = false;//set to stop
      
      //stop stopwatch
      if( sw.running ) sw.timeFromFirstStarttoPause+=millis()-sw.timeSinceStart;
      sw.running=false;
      
      delay(1000);
      
    }
  }
  
}

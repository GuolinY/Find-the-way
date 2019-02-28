class Background_Effect_Point{
  PVector pos, vel, dist;
  Background_Effect_Point(float a, float b, float c, float d){
    pos = new PVector(a,b);
    vel = new PVector(c,d);
  }
  
  void move(){
    
    if(pos.x>width || pos.x<0){
      vel.x = -vel.x;
    }
    if(pos.y>height || pos.y<0){
      vel.y = -vel.y;
    }
    
    pos.x+=vel.x;
    pos.y+=vel.y;
    
    stroke(#33cccc);
    fill(#33cccc);
    ellipse(pos.x,pos.y,5,5);
  }
  
  void drawLines(int p){
    for(int i=0;i<effect.points.size();i++){
      dist = new PVector(effect.points.get(p).pos.x-effect.points.get(i).pos.x,effect.points.get(p).pos.y-effect.points.get(i).pos.y);//vector from one dot to another
      if(dist.mag()<200 && effect.points.get(p)!=effect.points.get(i)){//if close enough and not comparing the same dot
        stroke(255-(255/200)*dist.mag(),0,0);//set colour of the line to white
        strokeWeight(2);
        line(effect.points.get(p).pos.x, effect.points.get(p).pos.y, effect.points.get(i).pos.x, effect.points.get(i).pos.y);
      }
    }
  }

}

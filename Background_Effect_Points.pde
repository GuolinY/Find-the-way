class Background_Effect_Points{
  
  ArrayList<Background_Effect_Point> points;
  
  Background_Effect_Points(){
    points = new ArrayList<Background_Effect_Point>();
  }
  
  void show(){
    for(int i=0;i<points.size();i++){
      points.get(i).drawLines(i);
    }
    for(int i=0;i<points.size();i++){
      points.get(i).move();//order of drawing lines first is such that lines dont cut across over the dot to the centre
    }
  }
  
}

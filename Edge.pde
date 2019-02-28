class Edge{

  int[] points = new int[4];
  boolean checkEdge = false,collision=false;
  Edge(int a,int b,int c,int d){
    points[0]=a;
    points[1]=b;
    points[2]=c;
    points[3]=d;
  }
  
  void show(){
    stroke(#ff5050);
    strokeWeight(5);
    strokeCap(PROJECT);
    line(points[0],points[1],points[2],points[3]);
  }
  
  void getValue(){
    println(points[0],points[1],points[2],points[3]);
  } 
  
}

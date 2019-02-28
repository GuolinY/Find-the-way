class Edges{
  ArrayList<Edge> edges;
  
  Edges(){
    
    edges = new ArrayList<Edge>();
    
    
    
    //-------------------------------------------------------
    int counter=0;
    for(int row=0;row<=h;row++){ //horizontal
          for(int col=0;col<h;col++){
            edges.add(new Edge(col*spacing,row*spacing,(col+1)*spacing,row*spacing));
            counter++;
        }
      }
      println();
      for(int col=0;col<=h;col++){ //vertical
          for(int row=0;row<h;row++){
            edges.add(new Edge(col*spacing,row*spacing,col*spacing,(row+1)*spacing));
            counter++;
        }
      }
    //======================================================
  }


  void show(){
    effect.show();
    // start/end zone/background of the maze
    fill(#ff5050);
    strokeWeight(0);
    rect(15,15,spacing-30,spacing-30,8);//start zone
    rect(height-spacing+15,height-spacing+15,spacing-30,spacing-30,8);//end zone
    
    for(int i=0;i<edges.size();i++){
      edges.get(i).show();
    }
  }
  
  void deleteElem(int pos){
    edges.remove(pos);
  }
  
  void getValues(){
    for(int i=0;i<edges.size();i++){
      edges.get(i).getValue();
    }
  }
  
  void divide(){
    for(int i=0;i<edges.size();i++){
      for(int j=0;j<4;j++){
        edges.get(i).points[j] /= spacing;
      }
    }
  }
  
  void multiply(){
    for(int i=0;i<edges.size();i++){
      for(int j=0;j<4;j++){
        edges.get(i).points[j] *= spacing;
      }
    }
  }
  

}

//https://www.youtube.com/watch?v=_rxBIlhDZPs
//https://en.wikipedia.org/wiki/Backtracking
//https://www.cs.bu.edu/teaching/alg/maze/
class Backtracker{
  
  int[][] path = new int[h][h];
  boolean show = false;
  boolean shownHELP = false;
  
  Backtracker(){
    
    //intiliase path all to 0, if path[i][j] = 1 then it is part of the path, if = -1 then invalid path
    for(int i=0;i<h;i++){
      for(int j=0;j<h;j++){
        path[i][j]=0; //<>// //<>//
      }
    }

    path[0][0]=1;//set starting position to 1 as it is part of the maze
    //path[3][3]=1;
    //findPath(0,0);//first call from starting pos
    
  }
  
  //returns the length of the solution through the maze
  int pathLength=0;
  void getPathLength(){
    for(int i=0;i<h;i++){
      for(int j=0;j<h;j++){
        if(path[i][j]==1){
          pathLength++;
        }
      }
    }
  }
  
  void show(){
    fill(255,80);
    strokeWeight(5);
    rect(height+50,500,370,120,8);
    textAlign(CENTER,CENTER);
    textSize(70);
    fill(mouseOverRect(height+50,500,370,120)?#33cccc:#ff5050);
    text("HELP", height+235,540);
    textSize(40);
    text("-150 POINTS",height+235,590);
    
    if(show){
      path[0][0]=0;//such that it doesnt draw over the start zone
      strokeWeight(5);
      fill(255,80);
      stroke(#33cccc);
      for(int i=0;i<h;i++){
        for(int j=0;j<h;j++){
          if(path[i][j]==1){
            rect((i)*spacing+25,(j)*spacing+25,spacing-50,spacing-50,8);
          }
        }
      }
    }
    
  }
  
  void solve(){
    findPath(0,0);
    getPathLength();
  }
  
  
  
  boolean findPath(int x, int y){
    //base cases
    if(x<0 || y<0 || x>=height/spacing || y>=height/spacing){//if outisde the maze,x or y smaller than 0 or greater than the height/spacing
      return false;
    }
    if(x==h-1 && y==h-1){//if goal, x and y equal to the height/spacing
      fill(#ff5050);
      rect((h-1)*spacing+25,(h-1)*spacing+25,spacing-50,spacing-50 );
      return true;
    }

    fill(#ff5050);
    path[x][y]=1;
    
    //recursive parts//can be more efficient
    if(x==0 && y==0){
     if(checkEast(x,y)){return true;}
      if(checkSouth(x,y)){return true;}
    }
    else if(x==0 && y<h-1){
      if(checkEast(x,y)){return true;}
      if(checkSouth(x,y)){return true;}
      if(checkNorth(x,y)){return true;}
    }
    else if(y==0 && x<h-1){
      if(checkEast(x,y)){return true;}
      if(checkSouth(x,y)){return true;}
      if(checkWest(x,y)){return true;}
    }
    else if(x==h-1){
      if(checkSouth(x,y)){return true;}
      if(checkWest(x,y)){return true;}
    }
    else if(y==h-1){
      if(checkEast(x,y)){return true;}
      if(checkNorth(x,y)){return true;}
    }
    else{ //<>// //<>//
      //recursive parts//keeps going back on itself and goes into an infinite loop ad able to cycle through two sqaures, up down up down up down up down...
      if(checkEast(x,y)){return true;}
      if(checkSouth(x,y)){return true;}  
      if(checkNorth(x,y)){return true;}
      if(checkWest(x,y)){return true;}
    }

    path[x][y]=-1;//set to -1 for invalid path
    fill(128);
    return false;
    }
  
  boolean findEdge(int a, int b, int c, int d){
    test.divide();
    for(int i=0;i<test.edges.size()-1;i++){
      if(b==d && c>a){//horizontal-right
        if(test.edges.get(i).points[0]==c && test.edges.get(i).points[1]==d && test.edges.get(i).points[2]==c && test.edges.get(i).points[3]==d+1){
          test.multiply();
          return false;//edge found, cant pass
        }
      }
      else if(a==c && d>b){//vertical-down
        if(test.edges.get(i).points[0]==c && test.edges.get(i).points[1]==d && test.edges.get(i).points[2]==c+1 && test.edges.get(i).points[3]==d){
          test.multiply();
          return false;//edge found, cant pass
        }  
      }
      
      
      else if(b==d && a>c){//horizontal-left
        if(test.edges.get(i).points[0]==a && test.edges.get(i).points[1]==b && test.edges.get(i).points[2]==a && test.edges.get(i).points[3]==b+1){
          test.multiply();
          return false;//edge found, cant pass
        }
      }
      else if(a==c && b>d){//vertical--up
        if(test.edges.get(i).points[0]==a && test.edges.get(i).points[1]==b && test.edges.get(i).points[2]==a+1 && test.edges.get(i).points[3]==b){
          test.multiply();
          return false;//edge found, cant pass
        }  
      }
    }
    
    
    test.multiply();
    return true;//no edge found
  }
  
  //functions to check each direction
  boolean checkNorth(int x, int y){
    if(path[x][y-1]==0 && findEdge(x,y,x,y-1)){//North of x,y
          if(findPath(x,y-1)){
            return true;
          }
        }
    return false;
  }
  boolean checkEast(int x, int y){
    if(path[x+1][y]==0 && findEdge(x,y,x+1,y)){//East of x,y
          if(findPath(x+1,y)){
            return true;
          }
        }
    return false;
  }
  boolean checkSouth(int x, int y){
    if(path[x][y+1]==0 && findEdge(x,y,x,y+1)){//South of x,y
          if(findPath(x,y+1)){
            return true;
          }
        }
    return false;
  }
  
  boolean checkWest(int x, int y){
    if(path[x-1][y]==0 && findEdge(x,y,x-1,y)){//West of x,y
      if(findPath(x-1,y)){
        return true;
        }
      }
      return false;
  }
}

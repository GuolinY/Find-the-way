class Algorithm{
  Algorithm(Edges ABC){
    //int count = ABC.edges.length;
    while(uniSet()){
      
      int e = (int)random(ABC.edges.size());
      
      println("1: ", e, ABC.edges.size());
      print("2: ");
      ABC.edges.get(e).getValue();
      if(ABC.edges.get(e).points[0]+ABC.edges.get(e).points[2]==0||
      ABC.edges.get(e).points[1]+ABC.edges.get(e).points[3]==0||
      ABC.edges.get(e).points[0]+ABC.edges.get(e).points[2]==2*height||
      ABC.edges.get(e).points[1]+ABC.edges.get(e).points[3]==2*height){
        
        println("3: Skipped");//NO need to get rid of edge
        
      }
      
      else{
        ABC.divide();
        //Horizontal----------------------
        if(ABC.edges.get(e).points[1]==ABC.edges.get(e).points[3]){
          println("Horizontal");
          if(Sets[ABC.edges.get(e).points[0]][ABC.edges.get(e).points[3]-1]!=Sets[ABC.edges.get(e).points[0]][ABC.edges.get(e).points[3]]){
            
            int z = Sets[ABC.edges.get(e).points[0]][ABC.edges.get(e).points[3]];
            //Union----------------------------------
            for(int i=0;i<h;i++){
             for(int j=0;j<h;j++){
               if(Sets[i][j]==z){
                 Sets[i][j] = Sets[ABC.edges.get(e).points[0]][ABC.edges.get(e).points[3]-1];
               }
             } 
            }
            //===================================
            ABC.deleteElem(e);
          
          }
        }
        //==================================================================
        //vertical------------------------------------
        else if(Sets[ABC.edges.get(e).points[2]-1][ABC.edges.get(e).points[1]]!=Sets[ABC.edges.get(e).points[2]][ABC.edges.get(e).points[1]]){
          println("Vertical");
          int z = Sets[ABC.edges.get(e).points[2]][ABC.edges.get(e).points[1]];
          //Union----------------------------------
          for(int i=0;i<h;i++){
            for(int j=0;j<h;j++){
              if(Sets[i][j]==z){
                Sets[i][j] = Sets[ABC.edges.get(e).points[2]-1][ABC.edges.get(e).points[1]];
              }
            } 
         }
         //===================================
         ABC.deleteElem(e);
       }
       //=================================================================================
      ABC.multiply();
      }
    }
    
  }
  
  



  boolean uniSet(){
  
    for(int i=0;i<h;i++){
     for(int j=0;j<h;j++){
       if(Sets[0][0]!=Sets[i][j]){
         return true;
       }
     }
  }
  
  return false;
    
  }




}

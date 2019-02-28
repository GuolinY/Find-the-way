class Scoreboard{
  
  String[] nameAndScores, names;
  int[] scores;
  
  Scoreboard(){
    nameAndScores = loadStrings("namesAndScores.txt");
    scores = new int[nameAndScores.length/2];
    names = new String[nameAndScores.length/2];
    
    for(int i=0;i<nameAndScores.length;i++){//sorting nameAndScores into name and scores
      
      if(i%2==0){
        scores[i/2] = int(nameAndScores[i]);        
      }
      else{
        names[(i-1)/2] = nameAndScores[i]; 
      }
    }
    
    //mergesort array(s)
    mergeSort(scores,names);   //<>// //<>//
  }
  
  void show(){
    background(0);
    effect.show();
    
    //BACK BUTTON
    stroke(#ff5050);
    strokeWeight(5);
    fill(255,80);
    rect(100,30,70,70,8);
    fill(mouseOverRect(100,30,70,70)?#33cccc:#ff5050);
    strokeWeight(0);
    triangle(115,65,155,40,155,90);
    
    //Background for scores to be displayed
    strokeWeight(5);
    fill(255,30);
    rect(100,130,1075,600,8);

    //HEADINGS FOR TABLE
    fill(#ff5050);
    textSize(80);
    textAlign(CENTER,CENTER);
    text("SCOREBOARD",width/2,60);
    
    textSize(50);
    textAlign(LEFT);
    text("Position",150,200);
    text("Name",400,200);
    text("Score",970,200);
    
    //OUTPUTTING SCORES TO WINDOW
    textSize(30);
    int numOfScores = scores.length;
    numOfScores = constrain(numOfScores,0,10);//makes sure only top ten are scored if there are more than 10 scores saved
    for(int i=0;i<numOfScores;i++){ //<>// //<>//
      text(i+1+":",220,270+i*45);
      if(names[i].length()>30){
        names[i]=names[i].substring(0,30);
        names[i]+=". . .";
      }
      text(names[i],400,270+i*45);//only box to have x and y restirctions due to variation of name lengths
      text(scores[i],1000,270+i*45);
    }
  }
  
  void mergeSort(int[] mergelist, String[] namelist){//need to switch around positions of names as well
  //reorder name and score arrays efficiently such that i can just output them 
  
    if(mergelist.length>1){
      int mid = (mergelist.length - mergelist.length%2)/2; //DIV
      
      int[] lefthalf=subset(mergelist,0,mid),righthalf=subset(mergelist,mid,mergelist.length-mid);
      
      String[] lefthalf_namelist=subset(namelist,0,mid),righthalf_namelist=subset(namelist,mid,namelist.length-mid);
      
      mergeSort(righthalf,righthalf_namelist);
      mergeSort(lefthalf,lefthalf_namelist);
      
      int i,j,k;//counters for left,right,combined repectively
      i=j=k=0;
      
      while(i<lefthalf.length && j<righthalf.length){
        if(righthalf[j]>lefthalf[i]){//if right is greater than right, place right into combined array descending order ">"
          mergelist[k] = righthalf[j];
          arrayCopy(righthalf_namelist,j,namelist,k,1);
          j++;
        }
        else{//else place left into combined array
          mergelist[k] = lefthalf[i];
          arrayCopy(lefthalf_namelist,i,namelist,k,1);
          i++;
        }
        k++;
      }
      
      //place remaining array at the end if counter hasnt reached the end of the array
      while(j<righthalf.length){
        mergelist[k] = righthalf[j];
        arrayCopy(righthalf_namelist,j,namelist,k,1);
        k++;
        j++;
      }
      while(i<lefthalf.length){
        mergelist[k] = lefthalf[i];
        arrayCopy(lefthalf_namelist,i,namelist,k,1);
        k++;
        i++;
      }

    }
  
  
  }
  
}

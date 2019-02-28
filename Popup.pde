class Popup{
  
  int x,y,w,h;
  String name = "";
  boolean nameSaved=false,errorName=false;
  
  Popup(){
  }
  
  void show(){//stops once it reaches middle and then disappears as new draw
    effect.show();
    textAlign(CENTER, CENTER);
    fill(#ff5050);
    textSize(80);
    if(bt.shownHELP){//if stuck and clicked the HELP button to show help
      text("COMPLETED\nScore: "+(int)(10000000/sw.timeFromFirstStarttoPause-150)+"\nENTER NAME:", width/2, height/4);
    }
    else{
      text("COMPLETED\nScore: "+(int)10000000/sw.timeFromFirstStarttoPause+"\nENTER NAME:", width/2, height/4);
    }
    text("COMPLETED\nScore: "+(int)10000000/sw.timeFromFirstStarttoPause+"\nENTER NAME:", width/2, height/4);
    textAlign(CENTER,TOP);
    text(name,100, height*0.5,width-200,height*0.4);
    if(errorName){
      fill(255,0,0);
      textSize(20);
      text("Please enter a name before saving",width/2,20);
    }
  }
  
  void store(){//stores the name of the player who has completed the maze
    //store in text file with score
      try {
        //initialisng--opening file
        File f = dataFile("namesAndScores.txt");    
        PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
       //writing
        sw.timeFromFirstStarttoPause = (int)10000000/sw.timeFromFirstStarttoPause;//quicker times have a greater score
        if(bt.shownHELP){//if stuck and clicked the HELP button to show help
          out.println(nf(sw.timeFromFirstStarttoPause-150));
        }
        else{
          out.println(nf(sw.timeFromFirstStarttoPause));
        }
        out.println(name);
        out.flush();//makes sure all remianing data is written to file
        out.close();//close text file
      }
      catch (IOException e) { //errors that may occur when reading text file are outputted here
        println(e);
      }
      
      nameSaved=true;
      name = "";//reset name after it has been stored ready for next go
  }
  
  
  
  
}

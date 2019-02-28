class Stopwatch{
  
  int timeSinceStart=0,timeFromFirstStarttoPause=0;//t is time since last (re)start, c is time since first start
  int[] timer = new int[2];//to store seconds and milliseconds
  boolean running = false;//is stopwatch running
  
  
  Stopwatch(){
    running  = false;
  }
  
  void show(){
    stroke(#ff5050);

    //clock
    fill(255,80);
    rect(height+50,25,width-height-80,200,8);
    
    //play button
    strokeWeight(5);
    fill(255,80);
    rect(height+55,250,160,200,8);//play
    fill(mouseOverRect(height+55,250,160,200)?#33cccc:#ff5050);
    strokeWeight(0);
    triangle(height+80,270,height+80,430,height+200,350);
    
    //pause button
    strokeWeight(5);
    fill(255,80);
    rect(height+255,250,160,200,8);//pause
    fill(mouseOverRect(height+255,250,160,200)?#33cccc:#ff5050);
    strokeWeight(0);
    rect(height+270,260,60,180,8);
    rect(height+340,260,60,180,8);
    
    //output stopwatch time
    fill(#ff5050);
    textSize(80);
    textAlign(CENTER,CENTER);
    //textFont(font, 80);
    if(running){
      timer[0] = (millis()-timeSinceStart+timeFromFirstStarttoPause-(millis()-timeSinceStart+timeFromFirstStarttoPause)%1000)/1000;//DIV
      timer[1] = (millis()-timeSinceStart+timeFromFirstStarttoPause)%1000;//MOD
    } 
    else{
      timer[0] = (timeFromFirstStarttoPause-timeFromFirstStarttoPause%1000)/1000;//DIV
      timer[1] = timeFromFirstStarttoPause%1000;//MOD
    } 
    text( timer[0]+":"+timer[1], height+235,125);
    
    //restart button
    strokeWeight(5);
    fill(255,80);
    rect(height+50,height-135,width-height-80,100,8);
    fill(mouseOverRect(height+50,height-135,width-height-80,100)?#33cccc:#ff5050);
    text("RESTART",height+240,710);
    
  }
  
}

class Screen{
  
  int x, y, w, h;
  
  Screen(int a, int b, int c, int d){
    x=a;
    y=b;
    w=c;
    h=d;
  }
  
  void show(){
    if(sw.running){
      noFill();
    }
    else{
      fill(#33cccc);
    }
    stroke(#ff5050);
    strokeWeight(5);
    rect(x,y,w,h);
    textAlign(CENTER,CENTER);
    textSize(50);
    fill(#ff5050);
    if(sw.timeFromFirstStarttoPause==0 && sw.timeSinceStart==0){//if timer hasnt started
      text("Click the Play Button to START",0,0,height,height);    
    }
    else if(sw.timeFromFirstStarttoPause>0 && !sw.running){//if timer has started and hasnt reached the end zone
      text("PAUSED\nClick the Play Button to RESUME",0,0,height,height);    
    }
  }
  
}

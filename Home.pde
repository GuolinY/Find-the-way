class Home{
  PImage musicIcon,musicIconHover;
  Home(){
    
  }
  
  void show(){
    background(0);
    effect.show();
    textAlign(CENTER,CENTER);
    
    //music toggle on/off switch
    stroke(#ff5050);
    strokeWeight(5);
    fill(255,80);
    rect(1150,25,75,75,8);
    if(mouseOverRect(1150,25,75,75)){
      image(musicIconHover,1150,28,75,75);
    }
    else{
      image(musicIcon,1150,28,75,75);
    }
    
    if(!playingMusic){//shows that music is not playing by putting a line through the music icon
      line(1222,28,1153,97);//not exactly corner to corner, adjusted for the rounded corners
    }
    
    //title
    fill(#ff5050);
    textSize(120);
    textAlign(CENTER,CENTER);
    text("FIND THE WAY",width/2,140);
    textSize(40);
    text("Created by Guolin Yang",width/2,210);
    
    //buttons
    stroke(#ff5050);
    strokeWeight(5);
    fill(255,80);
    rect((width/2)-400,350,800,100,8);
    rect((width/2)-400,500,800,100,8);
    rect((width/2)-400,650,800,100,8);
    
    //text for buttons
    textSize(80);
    fill(mouseOverRect((width/2)-400,350,800,100)?#33cccc:#ff5050);
    text("PLAY",width/2,400);    
    fill(mouseOverRect((width/2)-400,500,800,100)?#33cccc:#ff5050);
    text("SCOREBOARD",width/2,550);
    fill(mouseOverRect((width/2)-400,650,800,100)?#33cccc:#ff5050);
    text("INSTRUCTIONS",width/2,700);
  }
  
}

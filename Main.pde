import java.io.FileWriter;
import java.io.BufferedWriter;

import ddf.minim.*;
AudioPlayer player;
Minim minim;

Home homeScreen = new Home();
Instructions instructionsScreen = new Instructions();
Scoreboard sb;
Algorithm alg;
Backtracker bt;
int screenNo=0;
int count,spacing,h;
int[][] Sets = new int[h][h];
Edges test;
Stopwatch sw;
PFont myFont;
Screen screen;
Popup nameWin;
Dot dot;

boolean playingMusic;

Background_Effect_Points effect;

public void loadAssets(){
  playingMusic = true;
  minim=new Minim(this);//sets minim directory to the one which the source code is
  player = minim.loadFile("musicFile2.mp3");
  player.loop();
  myFont = createFont("font4.ttf",150);
  textFont(myFont);
}


void setup(){
  thread("loadAssets");
  
  smooth();
  size(1250,800);
  frameRate(100);
  background(0);
  
  homeScreen = new Home();
  homeScreen.musicIcon = loadImage("musicIcon.png");
  homeScreen.musicIconHover = loadImage("musicIcon-hover.png");
  instructionsScreen = new Instructions();
  screenNo=0;
  count=0;
  spacing=100;
  h=height/spacing;
  screen = new Screen(0,0,height,height);
  nameWin = new Popup();
  
  initialise();
  
  //Initialise background effect
  effect = new Background_Effect_Points();
  for(int i=0;i<20;i++){
    effect.points.add(new Background_Effect_Point(random(0,width),random(0,height),random(-1,1),random(-1,1)));//such that they dont all move in the positive x and y direction on initialisation
  }
}

void initialise(){  //reset the maze ready for a new game
  //Return to screen 0 which the main menu
  screenNo=0;
  
  //reset the maze
  count=0;
  Sets = new int[h][h];
  test = new Edges();
  //Initialise sets in the grid--------------------------------------------------
  for(int i=0;i<h;i++){
     for(int j=0;j<h;j++){
       Sets[i][j] = count;
       count++;
     }
  }
  //====================================================
  alg = new Algorithm(test);
  count=2*h*(h+1);
  
  sw = new Stopwatch();
  bt = new Backtracker(); 
  bt.solve();//solve the maze - need to solve maze before initialising dot
  dot = new Dot();
  
  nameWin.errorName = false;
  
}

void draw(){
  switch(screenNo){
    case 0:
      homeScreen.show();
      break;
    case 1: 
      sb = new Scoreboard();
      sb.show();
      break;
    case 2:
      instructionsScreen.show();
      break;
    case 3:
      test.show();
    default:
      homeScreen.show();
      break;
  }
  
  if(screenNo==3){
  
    background(0); //<>// //<>//
    if(!dot.end){
      
      //maze
      test.show();
      //sidebar
      sw.show();
      bt.show();
      
      dot.move();
      screen.show();
    }
    else{
      //show popup to enter name if dot is at the end of the maze
      nameWin.show();
    }
  }
  
  
}

boolean mouseOverRect(int x, int y, int w, int h){
    return(mouseX >=x && mouseX <= x+w && mouseY >= y && mouseY <=y+h);
}

void mouseReleased(){
  if(screenNo==0){//main menu
    if(mouseOverRect((width/2)-400,350,800,100)){
      //PLAY//show maze
      println("play");
      screenNo = 3;
    }
    else if(mouseOverRect((width/2)-400,500,800,100)){
      //SCOREBOARD
      println("scoreboard");
      screenNo = 1;
      
    }
    else if(mouseOverRect((width/2)-400,650,800,100)){
      //INSTRUCTIONS
      println("instructions");
      screenNo = 2;
    }
    else if(mouseOverRect(1150,25,75,75)){
      if(playingMusic){
        playingMusic = false;
        player.pause();
      }
      else{
        playingMusic = true;
        player.loop();
      }
    }
    
    
  }
  
  if(screenNo==1 || screenNo==2){//back button clciked?
      if(mouseOverRect(100,30,70,70)){
        sb = null;
        screenNo=0;
      }
    }
  
  if(screenNo==3){//playing
    if(!dot.end || dot.moving){//if dot is not at the end and is moving
      if(mouseOverRect(height+55,300,160,200)){//play-timer
         if( !sw.running ){
           sw.timeSinceStart=millis();
         }
         sw.running=true;
         
       }
       if(mouseOverRect(height+255,300,160,200)){//pause-timer
         if( sw.running ){
           sw.timeFromFirstStarttoPause+=millis()-sw.timeSinceStart;
         }
         sw.running=false;
         
         //set dot to stop moving
         dot.moving=false;
         dot.vel.x=0;
         dot.vel.y=0;
       }
       if(mouseOverRect(height+50,550,width-height-80,120)){
          if(bt.show){
            bt.show=false;
          }
          else{
            bt.shownHELP = false;
            bt.show=true;
          }
       }
       if(mouseOverRect(height+50,height-135,width-height-80,100)){
         initialise();
         
       }
    }
  }
  
  
  
}

void keyPressed(){
  if(screenNo == 3){
    if(dot.end){
      if(key<123 && key>64){
         nameWin.name = nameWin.name + key;
       }
       else if(key==BACKSPACE){
         if(nameWin.name.length()>=1){
           nameWin.name = nameWin.name.substring(0,nameWin.name.length()-1);
         }
     }
       else if(key==ENTER){
         if(trim(nameWin.name).equals("")){
            nameWin.errorName=true;
          }
         else{
           nameWin.store();
           initialise();//replace with going back to the home screen/main menu in future versions
         }
       }
    }
    else{  
      if(key<128){
        dot.keys[key]=true;
      }
    }
  }

}

void keyReleased(){
  if(!dot.end){
    if(key<128){
      dot.keys[key]=false;
    }
  }
}

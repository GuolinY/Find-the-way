class Instructions{
  Instructions(){
  
  }
  
  void show(){
    background(0);
    effect.show();
    textAlign(CENTER,CENTER);
    
    //BACK BUTTON
    stroke(#ff5050);
    strokeWeight(5);
    fill(255,80);
    rect(100,30,70,70,8);
    fill(mouseOverRect(100,30,70,70)?#33cccc:#ff5050);
    strokeWeight(0);
    triangle(115,65,155,40,155,90);
    
    //title
    fill(#ff5050);
    textSize(80);
    textAlign(CENTER,CENTER);
    text("INSTRUCTIONS",width/2,60);
    
    //Rectangle for text
    fill(255,30);
    stroke(#ff5050);
    strokeWeight(5);
    rect(100,130,1075,600,8);
    
    //text
    textAlign(LEFT);
    textSize(30);
    fill(#ff5050);
    text("Welcome to Find the Way. This is a game where you will tasked with finding your way through a maze under timed conditions.\n\nUse the WASD keys to navigate\n\nTo start the game, click the start button\nTo pause, click the pause button\n\nOnce you have completed the maze, type your name and press ENTER to save your score, maybe you can even see yourself in the top 10 leader board\n\nIf you need any help, feel free to press the HELP button\nIf you do use the help button, 150 points will be deducted from your final score",130,165,1050,680);
    
    
  }
  
}

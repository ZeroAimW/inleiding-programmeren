int[] vierkantX = {10,15,20,25,30};
int[] vierkantY = {10,15,20,25,30};
int size = 5;
String[] paragrafen ={"p1","p2"};


void setup(){
  size(500,500);
}

void draw(){
  for(int i = 0; i <5; i++){
    vierkantX[i] += 1;
    rect(vierkantX[i],vierkantY[i],size,size);
  }
}
  

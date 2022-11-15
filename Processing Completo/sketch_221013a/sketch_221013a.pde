import processing.sound.*;

SoundFile sonido;

PImage []celdas = new PImage[12];

int colX[]={790,840,890,940};
int filY[]={75,125,175};
int acc[]=  new int[12];
int col= 790;
int fil= 75;
int h = 0;
int dibu = 0;
int bandera = 0;
int instruc=0;
int p = 0;

PImage paso;
PImage der;
PImage izq;
PImage vacio;
PImage fondo;
PImage salto;
PImage vela;
PImage f1;
PImage f2;
PImage L;

float Lx = 290;
float Ly = 180;
float OLx = 0;
float OLy = 0;
float DLx = 0;
float DLy = 0;


void setup()
{
 size(1000, 500);
 fondo = loadImage("fondo1.jpg");
 fondo.resize(1000,500);
 L = loadImage("0.png");
 L.resize(80,100);
 paso = loadImage("avanza.jpg");
 paso.resize(47,47);
 der = loadImage("derecha.jpg");
 der.resize(47,47);
 izq = loadImage("izquierda.jpg");
 izq.resize(47,47);
 vacio = loadImage("vacio.jpg");
 vacio.resize(47,47);
 salto = loadImage("salto.jpg");
 salto.resize(47,47);
 vela = loadImage("vela.jpg");
 vela.resize(47,47);
 f1 = loadImage("f1.jpg");
 f1.resize(47,47);
 f2 = loadImage("f2.jpg");
 f2.resize(47,47);
 
 sonido = new SoundFile(this, "musica.wav");
 sonido.play();
   
 for(int i=0; i<12;i++){
  celdas[i] = loadImage("vacio.jpg");
  celdas[i].resize(47,47);
 }
 
}

void draw(){
   background(fondo);  
   text(mouseX, 50,50);
   textSize(40);
   text(mouseY, 50,90);
   
   if(dibu == 0){
   image(L,Lx,Ly);
   }
   if (dibu == 1){
     if(Lx < DLx){
    Lx = Lx + 1;
    image(L,Lx,Ly);
    if(Lx == DLx){
    dibu = 0;
    }
    if(Ly < DLy){
    Ly = Ly + 0.5;
    image(L,Lx,Ly);
    }
  }
}
   h = 0;
   
    fil= 74;
   for(int f = 0; f < 3; f++){
      col = 788;
     for(int c = 0; c<4; c++){
       
        image(celdas[h],col,fil);
        if(col< 900){
        col=col+52;
        }
        h++;  
      }
      if(fil <250){
      fil=fil+50;  
      }
   }
   
   if(instruc == 1){
    image(paso,mouseX-25,mouseY-25);
   }
   if(instruc == 2){
    image(der,mouseX-25,mouseY-25);
   }
   if(instruc == 3){
    image(izq,mouseX-25,mouseY-25);
   }
   if(instruc == 4){
    image(salto,mouseX-25,mouseY-25);
   }
   if(instruc == 5){
    image(vela,mouseX-25,mouseY-25);
   }
   if(instruc == 6){
    image(f1,mouseX-25,mouseY-25);
   }
   if(instruc == 7){
    image(f2,mouseX-25,mouseY-25);
   }
   
}
void mouseClicked(){
  if(mouseX > 640 && mouseY < 740 && mouseY >444 && mouseY <480){
  
  }
  
  
  if (bandera == 1){  //depositar
    p=0;
    for(int f=0;f<3;f++){
      for(int c=0;c<4;c++){
       
        if(mouseX > colX[c] && mouseX < (colX[c]+47) && mouseY > filY[f] && mouseY < (filY[f]+47)){
          actualizar(p, instruc);
          acc[p]= instruc;
        }
                  p++;
      }
    }
   
    bandera = 0;
    instruc=0;
  }
  if(bandera == 0){ //seleccion
 
 
  if(mouseX > 636 && mouseX < 680 && mouseY > 20 && mouseY < 60){
   
    instruc = 1;//paso
  }
  if(mouseX > 686 && mouseX < 733 && mouseY > 20 && mouseY < 60){
   
    instruc = 2;//derecha
  }
  if(mouseX > 740 && mouseX < 785 && mouseY > 20 && mouseY < 60){
   
    instruc = 3;//izquierda
  }
  if(mouseX > 790 && mouseX < 833 && mouseY > 20 && mouseY < 60){
   
    instruc = 4;//salto
  }
  if(mouseX > 843 && mouseX < 884 && mouseY > 20 && mouseY < 60){
   
    instruc = 5;//vela
  }
  if(mouseX > 894 && mouseX < 934 && mouseY > 20 && mouseY < 60){
   
    instruc = 6;//f1
  }
  if(mouseX > 943 && mouseX < 987 && mouseY > 20 && mouseY < 60){
   
    instruc = 7;//f2
  }
 
 
  if(mouseX > 640 && mouseX < 740 && mouseY > 444 && mouseY < 480){
   
    instruc = 0;//GO
    accion();
    for(int i = 0; i<12; i++){
    if(acc[i] == 1){
    avance();
    }
    }
  }
 
  bandera = 1;
  }
}

void actualizar(int pima, int cima){
  if(cima == 1){
  celdas[pima] = loadImage("avanza.jpg");
  celdas[pima].resize(47,47);
  }
 
   if(cima == 2){
  celdas[pima] = loadImage("derecha.jpg");
  celdas[pima].resize(47,47);
  }
 
   if(cima == 3){
  celdas[pima] = loadImage("izquierda.jpg");
  celdas[pima].resize(47,47);
  }
  if(cima == 4){
  celdas[pima] = loadImage("salto.jpg");
  celdas[pima].resize(47,47);
  }
  if(cima == 5){
  celdas[pima] = loadImage("vela.jpg");
  celdas[pima].resize(47,47);
  }
  if(cima == 6){
  celdas[pima] = loadImage("f1.jpg");
  celdas[pima].resize(47,47);
  }
  if(cima == 7){
  celdas[pima] = loadImage("f2.jpg");
  celdas[pima].resize(47,47);
  }
 
}

void accion(){
  for(int i = 0; i <12; i++){
   
    if(acc[i] == 1){
     DLx = Lx +40;
     DLy = Ly +20;
     dibu = 1;
    }
   
  }
}
void avance(){
 
}
 

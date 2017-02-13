float     diametre                = 100;  // Diamètre de ma sphère d'origine

int       IterationMax            = 9;
int       IterationAff            = 2;

float     Redim                   = 0.5;//sqrt(0.5);

float     Angle                   = 0.05;

float     degre                   = 2*3.141592654/360;
float     evolution               = 0;

String    DossierCaptures         = "G:\\fractalvideo2";
String    NomCaptures             = "FractaleCarree";
int       NombreDeCaptures        = 7200;
int       EnregistrementCaptures  = 1;

int       compteur                = 1;

int ModifTailleSphere        =1;


void setup()
{
  size(1920,1080, P3D);
  noStroke();
  smooth(32)  ;
}

void draw()
{
  background(0);                
  pointLight(192, 32, 32, sin(evolution/8)*diametre*2.7, cos(evolution/8)*diametre*3, -sin(evolution/8)*diametre*3.2);
    translate(sin(evolution/8)*diametre*2.7, cos(evolution/8)*diametre*3, -sin(evolution/8)*diametre*3.2);
    fill(192, 32, 32);
    emissive(192,0,0);
    sphere(5);

  pointLight(32, 32, 192, -sin(evolution/9)*diametre*3.1, -cos(evolution/9)*diametre*2.9, -sin(evolution/9)*diametre*2.8);
    translate(-sin(evolution/9)*diametre*3.1, -cos(evolution/9)*diametre*2.9, -sin(evolution/9)*diametre*2.8);
    fill(32, 32, 192);
    emissive(0,0,192);
    sphere(5);

  pointLight(32, 192, 32, cos(evolution/10)*diametre*2.6, cos(evolution/10)*diametre*3.05, cos(evolution/10)*diametre*3.15);
    translate(cos(evolution/10)*diametre*2.6, cos(evolution/10)*diametre*3.05, cos(evolution/10)*diametre*3.15);
    fill(32, 192, 32);
    emissive(0,192,0);
    sphere(5);

lightSpecular(128,128,128);

  ambientLight(0,0,0);

  camera(sin(evolution/16)*500, cos(evolution/16)*500, 700+sin(evolution/16)*sin(evolution/32)*600, 16/9*sin(evolution/16)*diametre, cos(evolution/16)*diametre, 0.0, 0.0, 1.0, 0.0);
  emissive(0,0,0);
  fill(255,255,255);

    scale(4);
    maFractale(1, IterationMax);
  scale(0.25);


  fill(64,64,64); 
  translate(0,0,-diametre*10);
  box(diametre*40, diametre*40, 5);
  
  translate(0,-diametre*10,0);
  box(diametre*40, 5, diametre*40);

  translate(0,diametre*20,0);
  box(diametre*40, 5, diametre*40);
  
  translate(diametre*20,0,0);
  box(5, diametre*40, diametre*40);

  translate(-diametre*40,0,0);
  box(5, diametre*40, diametre*40);


  SauveCaptures();

  evolution+=Angle;
  compteur+=1;
  
}

void maFractale(int it, int IterationMax)
{
  if(it>=IterationAff)
  {
 sphere(diametre*ModifTailleSphere);
  }
 if(it<IterationMax)
 {
   pushMatrix();  
      translate(diametre*(Redim*2+1),0,0);
      scale(Redim,Redim,Redim);
      rotateX(sin(it*evolution)*degre*3);
      rotateZ(cos(it*evolution)*degre*3);
      maFractale(it+1,IterationMax);
    popMatrix();

   pushMatrix();  
      translate(-diametre*(Redim*2+1),0,0);
      scale(Redim,Redim,Redim);
      rotateX(sin(it*evolution)*degre*5);
      rotateY(-cos(it*evolution)*degre*it*5);
      maFractale(it+1,IterationMax);
    popMatrix(); 

 }
}

void SauveCaptures()
{
  if(compteur<=NombreDeCaptures)
  {
 
      saveFrame(""+DossierCaptures+"/"+NomCaptures+"######.png");
  }
}

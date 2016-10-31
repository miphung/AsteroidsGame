SpaceShip yup = new SpaceShip();
Star sky[] = new Star[200];
public void setup() 
{
  size(500,500);
  for(int i=0; i < sky.length;i++)
  {
    sky[i] = new Star();
  }
}
public void draw() 
{
  background( 255,182,193);
  yup.show();
  yup.move();
  for (int i = 0; i < sky.length; i++)
    sky[i].show();
}
  public void keyPressed()
  {
    if (key == 'a')
      yup.rotate (-10);
    if (key == 'd')
      yup.rotate (10);
    if (key == 's')
      yup.accelerate(0.1);
    if (key == 'q')
    {
      yup.setX((int)(Math.random()*500));
      yup.setY((int)(Math.random()*500));
      yup.setDirectionX (0);
      yup.setDirectionY (0);
    }
  }
class Star
{
  private int myX , myY;
  public Star()
  {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  public void show()
  {
    fill( 255,245,238);
    noStroke();
    ellipse(myX, myY, 3, 3);
  }
}

class SpaceShip extends Floater  
{  
  public SpaceShip()
  {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    //nose
    xCorners[0] = 8;
    yCorners[0] = 0;
    //bottom point
    xCorners[1] = -6;
    yCorners[1] = 7;
    //top point
    xCorners[2] = -6;
    yCorners[2] = -7;
    //the part that goes in 
    xCorners[3] = -2;
    yCorners[3] = 0;

    myCenterX=250;
    myCenterY=250;
    myPointDirection = 248;
    myDirectionX = 0;
    myDirectionY = 0;
    myColor = 255;
  }
  public void setX(int x){myCenterX=x;};
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection=degrees;}   
  public double getPointDirection(){return myPointDirection;} 
}

class Asteroid extends Floater
{
  private int rotSpeed;
  public Asteroid()
  {
    if (Math.random() < 0.5)
    {
      rotSpeed = (int)(Math.random()*-1);
    } 
    else if () {
      rotSpeed = (int)(Math.random())
    }
    corners = 5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 8;
    yCorners[0] = 0;
    xCorners[1] = -6;
    yCorners[1] = 7;
    xCorners[2] = -6;
    yCorners[2] = -7;
    xCorners[3] = -2;
    yCorners[3] = 0;
    xCorners[4] = 2;
    yCorners[4] = 3;
    myCenterX=250;
    myCenterY=250;
    myPointDirection = 248;
    myDirectionX = 0;
    myDirectionY = 0;
    myColor = 255;
  }
  public void setX(int x){myCenterX=x;};
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY=y;}   
  public int getY(){return (int)myCenterY;}   
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;}   
  public void setPointDirection(int degrees){myPointDirection=degrees;}   
  public double getPointDirection(){return myPointDirection;} 
  
  public void move()
  {

  }
  public void show()
  {

  }
} 

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(0);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }

}


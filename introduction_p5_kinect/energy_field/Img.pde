//-- Img / @kikko_fr
//-- ECV Kinect Workshop 2013 

class Img extends PVector {
  
  PImage img;
  PVector velocity;
  float rotation;
  float scale;
  float alpha;
  int numUpdates;
  
  boolean bGrowing;
  
  float dRotation, rotationDest;
  
  Img(PImage img_, PVector velocity_)
  {
    img = img_;
    velocity = velocity_;
    
    rotation = 0;
    scale = initScale;
    alpha = 0.8 + random(0.2);
    
    rotationDest = random(to_rotationRandom) + to_rotation;
    rotation = atan2(velocity.y, velocity.x) / 3.14 * 180;
  }
  
  boolean update()
  {
    //dRotation = (rotationDest - rotation) * 0.05;
    //rotation += dRotation;
    
    // apply friction
    velocity.x *= speedModifier;
    velocity.y *= speedModifier;
    velocity.z *= speedModifier;
    
    // apply velocity
    x += velocity.x;
    y += velocity.y;
    
    alpha *= alphaModifier;
    scale *= scaleModifier;
    
    // return validity of this image
    boolean isValid = alpha > 0.1;
    
    return isValid;
  }
  
  void draw(PApplet ctx)
  {
    ctx.pushMatrix();
    
    ctx.translate(x, y);
    ctx.scale(scale);
    ctx.rotate( radians(rotation) );
    
    tint(255, alpha*255);
    image( img, - img.width*0.5, - img.height*0.5, img.width, img.height);
    
    ctx.popMatrix();
  }
}

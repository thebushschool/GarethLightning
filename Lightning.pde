int sizeY = 400;
int sizeX = 400;
int increment = 10;
int[] range = {-9, 9};
void setup()
{
  surface.setSize(sizeX, sizeY);
  background(0);
  drawLightning();
}

void draw() {
}

void mousePressed()
{
  drawLightning();
}

void drawLightning() {
  // the random weights with lightning movement does not get the desired result,
  // we would need to be able to control the general direction/endpoint to do this,
  // which seems to be outside of the scope of this assignment
  color lightingColor = getRandColor();
  int x = sizeX / 2;
  strokeWeight(5);
  for (int y = 0; y < sizeY; y += increment) {
    int rand = (int)lerp(range[0], range[1], (float)Math.random());
    x += rand;
    stroke(lightingColor);
    line(x - rand, y - increment, x, y);
  }
}

color getRandColor() {
  int r = (int)lerp(0.0, 255.0, (float)Math.random());
  int g = (int)lerp(0.0, 255.0, (float)Math.random());
  int b = (int)lerp(0.0, 255.0, (float)Math.random());
  return color(r, g, b);
}

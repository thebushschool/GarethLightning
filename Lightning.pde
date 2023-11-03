int increment = -5;
int[] range = {-5, 5};
PVector[] positions = {new PVector(131, 40), new PVector(477, 156), new PVector(251, 212)};
PImage img;

void setup() {
  size(631, 360);
  img = loadImage("seattle.jpeg");
  noLoop();
}

void draw() {
  background(img);
  drawLightning();
}

void mousePressed()
{
  background(img);
  drawLightning();
}

void drawLightning() {
  float x = 0.0;
  float y = 0.0;
  // weighted random
  float randPercent = (float)Math.random();
  if (randPercent < 0.3) {
    y = positions[0].y;
    x = positions[0].x;
  } else if (randPercent < 0.9) {
    y = positions[1].y;
    x = positions[1].x;
  } else {
    y = positions[2].y;
    x = positions[2].x;
  }
  // setup colors/size
  color lightingColor = getRandColor();
  strokeWeight(3);
  float offset = lerp(-2, 2, (float)Math.random());
  while (y > 0) {
    float rand = (int)lerp(range[0] + offset, range[1] + offset, (float)Math.random());
    x += rand;
    y += increment;
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

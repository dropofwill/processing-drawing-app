class Ball extends Entity {
  float x, y, radius;

  Ball(ArrayList<Entity> displayList, float x_, float y_, float radius_) {
    super(displayList);
    x = x_;
    y = y_;
    radius = radius_;
    fill(255, 255, 255, 30);
  }

  void render() {
    ellipseMode(RADIUS);
    ellipse(x, y, radius, radius);
  }
}

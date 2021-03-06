class Point {
  float x, y, d;
  Point normal = null;
  boolean showLabels = false;

  Point(float x, float y) {
    moveTo(x,y);
  }

  Point(Point o) {
    moveTo(o.x, o.y);
    normal = normalize();
  }

  // normalize
  Point normalize() {
    return new Point(x/d, y/d);
  }

  // repositioning
  void moveTo(float x_, float y_) {
  	  x = x_;
  	  y = y_;
  	  d = sqrt(x * x + y * y);
  }

  void moveTo(float x_, float y_, float ratio) {
  	  x = x_ * ratio;
  	  y = y_ * ratio;
  	  d = sqrt(x * x + y * y);
  }

  void moveBy(float x_, float y_) {
  	  moveTo(x + x_, y + y_);
  }

  // Is the mouse roughly over this point?
  boolean over() {
    return abs(mouseX - x) < 5 && abs(mouseY - y) < 5;
  }
  float getX() { return x; }
  float getY() { return y; }

  String toString() {
  	  return x+"/"+y+(normal!=null ? " (normal: "+normal.toString()+")" : "");
  }

  // point render functions
  void render() {
  	  ellipse(x, y, 3, 3);
  }

  void render(String label) {
    render();
    if(showLabels) {
      fill(0);
      text(label + (int)x + "/" + (int)y, x + 10, y);
      noFill();
    }
  }
}

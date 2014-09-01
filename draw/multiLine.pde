class MultiLine extends Entity {
	int strokeWidth;
	color fg;
	ArrayList<Point> pointList = new ArrayList<Point>();

	MultiLine(ArrayList<Entity> displayList, color fg_, int strokeWidth_) {
		super(displayList);
		strokeWidth = strokeWidth_;
		fg = fg_;
	}

	public void render() {
		for (int i=0; i < pointList.size(); i++) {
			Point a = pointList.get(i);

			if (i < pointList.size() - 1) {
				Point b = pointList.get(i + 1);

				float ax = a.getX(),
					  ay = a.getY(),
					  bx = b.getX(),
					  by = b.getY();

				stroke(0);
				strokeWeight(2);
				line(ax, ay, bx, by);
			}
			a.render();
		}
	}

	public void addPoint(float x_, float y_) {
		Point point_ = new Point(x_, y_);
		println(point_);
		pointList.add(point_);
		println(pointList);
	}

	public ArrayList<Point> getPointList() {
		return pointList;
	}
} 

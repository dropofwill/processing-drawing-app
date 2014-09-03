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

			// Only render dots in move mode
			if (curMode == "move" || curMode == "remove") {
				a.render();
			}
		}

		// Render first dot in point mode
		if (curMode == "point" && pointList.size() == 1) {
			pointList.get(0).render();
		}
	}

	public void addPoint(float x_, float y_) {
		Point point_ = new Point(x_, y_);
		pointList.add(point_);
	}

	public ArrayList<Point> getPointList() {
		return pointList;
	}
} 

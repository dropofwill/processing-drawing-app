class Bezier extends Entity {
	int strokeWidth;
	color fg;
	ArrayList<Point[]> pointArrays = new ArrayList<Point[]>();

	Bezier(ArrayList<Entity> displayList, color fg_, int strokeWidth_) {
		super(displayList);
		strokeWidth = strokeWidth_;
		fg = fg_;
	}

	public void render() {
		for (int i=0; i < pointArrays.size(); i++) {
			Point[] points = pointArrays.get(i);

			Point a = points[0];
			Point b = points[1];

			float ax = a.getX(),
				  ay = a.getY(),
				  bx = b.getX(),
				  by = b.getY();

			stroke(0);
			strokeWeight(2);
			line(ax, ay, bx, by);
		}
	}

	public void addPointPair(float x1_, float y1_, float x2_, float y2_) {
		Point[] points = new Point[2];
		points[0] = new Point(x1_, y1_);
		points[1] = new Point(x2_, y2_);

		println(points[0], points[1]);
		pointArrays.add(points);
		println(pointArrays);
	}

	public void addPointPair(Point point1, Point point2) {
		Point[] points = new Point[2];
		points[0] = point1;
		points[1] = point2;

		println(points[0], points[1]);
		pointArrays.add(points);
		println(pointArrays);
	}

	public ArrayList<Point[]> getPointList() {
		return pointArrays;
	}
} 


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
		//for (int i=0; i < pointArrays.size(); i++) {
			//Point a = pointArrays.get(i);

			//if (i < pointArrays.size() - 1) {
				//Point b = pointArrays.get(i + 1);

				//float ax = a.getX(),
					  //ay = a.getY(),
					  //bx = b.getX(),
					  //by = b.getY();

				//stroke(0);
				//strokeWeight(2);
				//line(ax, ay, bx, by);
			//}
			//a.render();
		//}
	}

	public void addPoint(float x_, float y_) {
		//Point point_ = new Point(x_, y_);
		//println(point_);
		//pointArrays.add(point_);
		//println(pointArrays);
	}

	public ArrayList<Point[]> getPointList() {
		return pointArrays;
	}
} 


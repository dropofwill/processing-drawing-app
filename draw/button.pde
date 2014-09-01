class Button extends Entity {
	int x,
		  y,
		  w,
		  h,
		  fSize;
	String title;
	color bg,
		  fg;
	Runnable action;

	Button(ArrayList<Entity> displayList, Runnable action_, int x_, int y_, int w_, int h_, int fSize_, String title_, color bg_, color fg_) {
		super(displayList);
		action = action_;
		x = x_;
		y = y_;
		w = w_;
		h = h_;
		fSize = fSize_;
		title = title_;
		fg = fg_;
		bg = bg_;
	}

	public void render() {
		strokeWeight(1);
		fill(bg);
		rect(x, y, w, h, 8);

		fill(fg);
		textAlign(CENTER, CENTER);
		textSize(fSize);
		text(title, x, y, w, h);
	}

	public boolean over() {
		if (mouseX >= x && mouseX <= x+w &&
			mouseY >= y && mouseY <= y+h) {
			return true;
		}
		else {
			return false;
		}
	}

	public void click() {
		action.run();
	}
}

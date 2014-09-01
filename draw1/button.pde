class Button extends Entity {
	float x,
	      y,
	      w,
	      h,
	      fSize;
	String title;
	color bg,
	      fg;
	boolean over = false,
		pressed = false;

	Button(ArrayList<Entity> displayList, float x_, float y_, float w_, float h_, float fSize_, String title_, color bg_, color fg_) {
		super(displayList);
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
}

class Button extends Entity {
	float x,
	      y;
	char title;
	color fill,
	      text;

	Button(ArrayList<Entity> displayList, float x_, float y_, char title_, color fill_, color text_) {
		super(displayList);
		x = x_;
		y = y_;
		title = title_;
		fill = fill_;
		text = text_;
	}

	void render() {

	}
}

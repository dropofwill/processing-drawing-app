import java.util.Iterator;

Ball ball;
Button button;

ArrayList<Entity> displayList = new ArrayList<Entity>();
Button[] buttonList = new Button[1];

int black = color(0),
      white = color(255);

void setup() {
	size(720, 500);
	smooth();
	background(55);
	ball = new Ball(displayList, width/2, height/2, 50);
	button = new Button(displayList, 5, 5, 100, 40, 12, "Save", color(255), color(0));
	buttonList[0] = button;
}

void draw() {
	Iterator<Entity> iter = displayList.iterator();

	while ( iter.hasNext() ) {
		Entity e = iter.next();

		if ( e.shouldRender() ) {
			e.render();
		}
		else {
			e.hide();
			iter.remove();
			e = null;
		}
	}
}

void mouseClicked() {
	for (int i=0; i < buttonList.length; i++) {
		Button currentButton = buttonList[i];
		if (currentButton instanceof Button) {
			println(((Button) currentButton).over());

		}
	}
}

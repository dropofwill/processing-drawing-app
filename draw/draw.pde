import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;

Ball ball;
Button button;

ArrayList<Entity> displayList = new ArrayList<Entity>();
Button[] buttonList = new Button[5];

int black = color(0),
	white = color(255),
	width = 1080,
	height = 720;

String curMode = "";

void setup() {
	size(width, height);
	smooth();
	background(255);
	//ball = new Ball(displayList, width/2, height/2, 50);

	// Setup the UI in a nice line along the top
	int curWidth = 40,
		curLeft = 5;

	buttonList[0] = new Button(displayList, saveImage,  curLeft, 5, curWidth, 20, 12, "Save", color(255), color(0));
	curLeft += curWidth + 45;
	buttonList[1] = new Button(displayList, clearDrawing, curLeft, 5, curWidth, 20, 12, "Clear", color(255), color(0));
	curLeft += curWidth + 5;
	curWidth = 80;
	buttonList[2] = new Button(displayList, toggleFree, curLeft, 5, curWidth, 20, 12, "Free Mode", color(255), color(0));
	curLeft += curWidth + 5;
	buttonList[3] = new Button(displayList, togglePoint, curLeft, 5, curWidth, 20, 12, "Point Mode", color(255), color(0));
	curLeft += curWidth + 5;
	buttonList[4] = new Button(displayList, toggleCurve, curLeft, 5, curWidth, 20, 12, "Curve Mode", color(255), color(0));
}

void draw() {
	// Render the objects in the displayList
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

	if (mousePressed) {
		if (curMode == "free") {
			println("free hand");
			stroke(0);
			line(mouseX, mouseY, pmouseX, pmouseY);
		}
	}
}

// Create a "runnable" blocks of code that can be passed as a parameters
Runnable saveImage = new Runnable() {
	@Override
	public void run() {
		java.util.Date date = new java.util.Date();
		Timestamp timestamp = new Timestamp(date.getTime());
		println("Screenshot_" + timestamp);
		save("screenshot_" + timestamp + ".jpg");
	}
};

Runnable toggleFree = new Runnable() {
	@Override
	public void run() {
		curMode = "free";
		println(curMode);
	}
};

Runnable togglePoint = new Runnable() {
	@Override
	public void run() {
		curMode = "point";
		println(curMode);
	}
};

Runnable toggleCurve = new Runnable() {
	@Override
	public void run() {
		curMode = "curve";
		println(curMode);
	}
};

Runnable clearDrawing = new Runnable() {
	@Override
	public void run() {
		background(white);
		println("Clear");
	}
};

void mouseClicked() {
	for (int i=0; i < buttonList.length; i++) {
		Button currentButton = buttonList[i];
		if (currentButton instanceof Button) {
			if (((Button) currentButton).over()) {
				((Button) currentButton).click();
			}
		}
	}

	if (curMode == "point") {

	}
	if (curMode == "curve") {

	}
}

void mousePressed() {
}

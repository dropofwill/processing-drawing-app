import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;

Button button;

ArrayList<Entity> displayList = new ArrayList<Entity>();
ArrayList<MultiLine> lineList = new ArrayList<MultiLine>();
Button[] buttonList = new Button[6];

Point pointToMove = null;
Point curPoint = null;

int fg = color(0),
	bg = color(255),
	highlight = color(20),
	width = 1080,
	height = 720;

String curMode = "";

void setup() {
	size(width, height);
	smooth(2);
	background(255);
	
	renderButtons();
}

void draw() {
	background(bg);

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
}

// Setup the UI in a nice line along the top
void renderButtons() {
	int curWidth = 40,
		curLeft = 5;

	buttonList[0] = new Button(displayList, saveImage,  curLeft, 5, curWidth, 20, 12, "Save", bg, fg);
	curLeft += curWidth + 45;
	buttonList[1] = new Button(displayList, clearDrawing, curLeft, 5, curWidth, 20, 12, "Clear", bg, fg);
	curLeft += curWidth + 5;
	curWidth = 70;
	buttonList[2] = new Button(displayList, toggleFree, curLeft, 5, curWidth, 20, 12, "Freehand", bg, fg, "free");
	curLeft += curWidth + 5;
	curWidth = 75;
	buttonList[3] = new Button(displayList, togglePoint, curLeft, 5, curWidth, 20, 12, "Plot Points", bg, fg, "point");
	curLeft += curWidth + 5;
	curWidth = 100;
	buttonList[4] = new Button(displayList, toggleRemove, curLeft, 5, curWidth, 20, 12, "Remove Points", bg, fg, "remove");
	curLeft += curWidth + 5;
	curWidth = 85;
	buttonList[5] = new Button(displayList, toggleMove, curLeft, 5, curWidth, 20, 12, "Move Points", bg, fg, "move");
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
		if (curMode != "free") {
			curMode = "free";
		}
		else {
			curMode = "";
		}
		println(curMode);
	}
};

Runnable togglePoint = new Runnable() {
	@Override
	public void run() {
		if (curMode != "point") {
			MultiLine newMultiLine = new MultiLine(displayList, fg, 1);
			lineList.add(newMultiLine);
			curMode = "point";
		}
		else {
			curMode = "";
		}
		println(curMode);
	}
};

Runnable toggleRemove = new Runnable() {
	@Override
	public void run() {
		if (curMode != "remove") {
			curMode = "remove";
		}
		else {
			curMode = "";
		}
		println(curMode);
	}
};

Runnable toggleMove = new Runnable() {
	@Override
	public void run() {
		if (curMode != "move") {
			curMode = "move";
		}
		else {
			curMode = "";
		}
		println(curMode);
	}
};

Runnable clearDrawing = new Runnable() {
	@Override
	public void run() {
		background(bg);
		println("Clear");

		Iterator<Entity> iter = displayList.iterator();
		while ( iter.hasNext() ) {
			Entity e = iter.next();
			if (!(e instanceof Button)) {
				e.hide();
				iter.remove();
				e = null;
			}
		}
	}
};

void mouseClicked() {
	boolean checkBtnState = false;

	for (int i=0; i < buttonList.length; i++) {
		if (((Button) buttonList[i]).over()) {
			checkBtnState = true;
		}
	}

	if (checkBtnState == true) {
		for (int i=0; i < buttonList.length; i++) {
			Button currentButton = buttonList[i];
			currentButton.resetState();

			if (((Button) currentButton).over()) {
				((Button) currentButton).click();
			}
		}
		return;
	}

	if (curMode == "point") {
		MultiLine curLine = lineList.get(lineList.size()-1);
		curLine.addPoint(mouseX, mouseY);
	}

	if (curMode == "remove") {
		for (int i=0; i < lineList.size(); i++) {
			ArrayList<Point> aPointList = lineList.get(i).getPointList();

			for (int j=0; j < aPointList.size(); j++) {
				Point aPoint = aPointList.get(j);

				if (aPoint.over()) {
					aPointList.remove(j);				
				}
			}
		}
	}
}

void mousePressed() {
	if (curMode == "free") {
		MultiLine freeLine = new MultiLine(displayList, fg, 1);
		lineList.add(freeLine);
	}

	if (curMode == "move") {
		for (int i=0; i < lineList.size(); i++) {
			ArrayList<Point> aPointList = lineList.get(i).getPointList();

			for (int j=0; j < aPointList.size(); j++) {
				Point aPoint = aPointList.get(j);

				if (aPoint.over()) {
					pointToMove = aPoint;
					return;
				}
			}
		}
	}
}

void mouseDragged() {
	if (curMode == "move") {
		if (pointToMove != null) {
			pointToMove.moveTo(mouseX, mouseY);
		}
	}

	if (curMode == "free") {
		MultiLine curMultiLine = lineList.get(lineList.size()-1);
		curMultiLine.addPoint(mouseX, mouseY);
	}
}

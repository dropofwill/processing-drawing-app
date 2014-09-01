import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.sql.Timestamp; 
import java.util.Date; 
import java.util.Iterator; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class draw1 extends PApplet {





Ball ball;
Button button;

ArrayList<Entity> displayList = new ArrayList<Entity>();
Button[] buttonList = new Button[5];

int black = color(0),
	white = color(255),
	width = 1080,
	height = 720;

String curMode = "";

public void setup() {
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

public void draw() {
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
		println("mousePressed");
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

public void mouseClicked() {
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

public void mousePressed() {
}
class Ball extends Entity {
  float x, y, radius;

  Ball(ArrayList<Entity> displayList, float x_, float y_, float radius_) {
    super(displayList);
    x = x_;
    y = y_;
    radius = radius_;
    fill(255, 255, 255, 30);
  }

  public void render() {
    ellipseMode(RADIUS);
    ellipse(x, y, radius, radius);
  }
}
class Button extends Entity {
    float x,
	  y,
	  w,
	  h,
	  fSize;
    String title;
    int bg,
	  fg;
    boolean over = false,
	    pressed = false;
    Runnable action;

    Button(ArrayList<Entity> displayList, Runnable action_, float x_, float y_, float w_, float h_, float fSize_, String title_, int bg_, int fg_) {
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
class Entity {
    public boolean render = true;
    private ArrayList<Entity> myDisplayList;

    Entity(ArrayList<Entity> displayList) {
	myDisplayList = displayList;	
	myDisplayList.add(this);
    }

    public void render() {
    }

    public void hide() {
	render = false;
    }

    public boolean shouldRender() {
	return render;
    }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "draw1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

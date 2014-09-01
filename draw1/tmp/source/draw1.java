import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

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
Button[] buttonList = new Button[1];

int black = color(0),
      white = color(255);

public void setup() {
	size(720, 500);
	smooth();
	background(55);
	ball = new Ball(displayList, width/2, height/2, 50);
	button = new Button(displayList, 5, 5, 100, 40, 12, "Save", color(255), color(0));
	buttonList[0] = button;
}

public void draw() {
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

public void mouseClicked() {
	for (int i=0; i < buttonList.length; i++) {
		Button currentButton = buttonList[i];
		println(currentButton);
		if (currentButton instanceof Button) {
			println(((Button) currentButton).over());
		}
	}
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

	Button(ArrayList<Entity> displayList, float x_, float y_, float w_, float h_, float fSize_, String title_, int bg_, int fg_) {
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

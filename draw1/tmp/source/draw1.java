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



Entity entity;
Ball ball;
ArrayList<Entity> displayList = new ArrayList<Entity>();

public void setup() {
	size(400, 400);
	ball = new Ball(displayList, width/2, height/2, 50);
}

public void draw() {
	background(55);
	
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

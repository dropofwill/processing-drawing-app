import java.util.Iterator;

Entity entity;
Ball ball;
ArrayList<Entity> displayList = new ArrayList<Entity>();

void setup() {
	size(400, 400);
	ball = new Ball(displayList, width/2, height/2, 50);
}

void draw() {
	//background(55);
	
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

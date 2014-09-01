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

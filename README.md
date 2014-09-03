Processing Java Drawing App
===========

HW 1, Will Paul (whp3652)
Basic drawing app built with the Java library processing
[Repository](www.github.com/dropofwill/processing-drawing-app): www.github.com/dropofwill/processing-drawing-app

### Usage
This drawing app lets you draw lines either freehand or by plotting points. What makes it cool is how editable the lines are, processing makes it easy to draw things to the screen, but keeping track of what you've already put there can be a bit more challenging.

To accomplish this I created my own Point and Line classes as well as a displayList used to handle rendering in draw().

### Classes
Entity, Button, Point, and MultiLine classes. 

### Arrays
There are 5 buttons created and stored as an array when the app starts.

I used polymorphism to keep track of drawing objects to the screen in an attempt to mirror ActionScripts concept of a display list. So there is one main array list that holds Entities, which all my visual objects extend. This keeps my draw method more managable and forces the use of a standardized api for all the visual objects (render(), remove(), etc.) to interact with.

### Interactivity
Instead of subclassing each button or putting all the business logic in the main mouseClicked event, I decided to pass "runnable" blocks of code to the button's constructor, which are then called whenever mouseClicked happens on top of the button.

For the save button I append a timestamp to the file name so that it won't be overwritten each time.

#### Events used:
- mouseClicked() (for buttons, plotting points in point mode, and removing them in remove mode),
- mousePressed() (for initiating a new line in freehand mode and selecting points in move mode),
- mouseDragged() (for drawing in freehand mode and moving points about in move mode).

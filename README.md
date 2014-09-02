Processing Java Drawing App
===========

HW 1, Will Paul (whp3652)
Basic drawing app built with the Java library processing

###Classes
Button, Point, Line, and Curve classes. 

###Arrays
There are 5 buttons created and stored as an array when the app starts.

I used polymorphism to keep track of drawing things to the screen. So there is one main displayList array list that holds Entities, which all my visual objects extend. This keeps my draw method more managable and forces the use of a standardized api for all my visual objects (render(), remove(), etc.) to interact with.

###Interactivity
Instead of subclassing each button or putting all the business logic in the main mouseClicked event, I decided to pass "runnable" blocks of code to the button's constructor, which are then called whenever mouseClicked happens on top of the button.

For the save button I append a timestamp to the file name so that it won't be overwritten each time.

####Events used:
- mouseClicked() (for buttons and plotting points in point mode),
- mousePressed() (for initiating a new line in freehand mode and selecting points in edit mode),
- mouseDragged() (for drawing in freehand mode and moving points about in edit mode).

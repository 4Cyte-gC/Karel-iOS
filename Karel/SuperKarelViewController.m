// The computer reads everything, starting from the first line, then the second, and so on.
// Notice the line numbers to the left.
// If the computer can't understand it, it'll produce an error!

// Here we've added two slashes to the left.  This is called a COMMENT
// Comments mean that the computer will ignore everything on this line.
// We can write whatever we want here!  It's turned green, to remind you.
// ** Fix the next 2 lines of the file so that there are no errors **

Look at me producing an error on the left!
Fix me fix me!

//  Usually we write a short description, so that other people can read our code.
//  It includes the name of the file and the name of the author (you):

//  File name: SuperKarelViewController.m
//  Description: Makes Karel the robot do cool things
//  ** add a line with your name **

//  Notice that the file name has the EXTENSION .m
//  This stands for the IMPLEMENTATION of SuperKarelViewController
//  Let's look at this name for a second.
//  Super Karel is a good descriptive name for what we're doing.
//  Karel is the base robot.  Super Karel is the fancy version that we're writing.
//  A VIEW is something that goes on the screen.
//  This is a VIEW CONTROLLER because it controls the stuff on the screen.


#import "SuperKarelViewController.h"
//  The #import tells the computer that we need to import a file.
//  It would NOT work if it just said import without the #.
//  ** Try taking away the # and look at the error **
//  SuperKarelViewController.h is the name of the file that we're importing
//  This lets us use all the commands we talked about like move and turnRight


//  The line @implementation SuperKarelViewController is the beginning of our IMPLEMENTATION
//  The implementation is all the code that we're going to write.
//  This line is called the HEADER.  It starts the implementation.
//  The word @end at the very bottom of this file ends the implementation
//  Remember that all the code that you write goes IN BETWEEN THE @implementation and the @end
//  Look how we get an error:
[self move];

@implementation SuperKarelViewController

// Now that we're inside the IMPLEMENTATION, let's write some code!

// The first thing to do is DEFINE A METHOD
// A method is something that the code can do.
// This particular method will be called RUN, because it RUNS the code for Karel the Robot.
// In the Karel program, RUN is a special method, because it gets executed AUTOMATICALLY 

// You've probably noticed that with code there's a special way that we write everything
// that's called SYNTAX
// the syntax we use to define a method is
// - (void) oneWordMethodNameHere {  CODE CODE CODE }

- (void) run {
    // notice the { on the line above and the } below.
    // the { is called an OPENING BRACE.  it starts where your code can go.
    // the } is called a CLOSING BRACE.  it finishes where your code can go.
    // this is called the BODY of the method
    // So anything that you write for the run method must go between the two braces.
    
    // note that all the code here is indented with a tab.
    // this makes it easier to see that this code belongs INSIDE of the run method.
    
    // Now, let's write a command.  Really, this is just executing a method called move.
    [self move];
    
    // It's important to get the SYNTAX of these commands correct.
    // SYNTAX is the formula for how we write commands that the computer can understand.
    // 1. Start with a [.  This an OPENING BRACKET.
    // 2. Write the name of the thing that you want to do the command.
    //    self refers to the current SuperKarelViewController.
    // 3. Write the name of the command.  Here it's move
    //    it is always ONE WORD, and the capitalization must be PERFECT.
    // 4. CLOSE the BRACKET by with a ].
    // 5. ALWAYS end a statement with a ;
    // Otherwise you'll get an error.
    
    // try writing some more.
    // remember the names of the other methods that Karel can do:
    // turnRight, putBeeper, and pickBeeper
    // they all have to be ONE WORD and the capitalization must be PERFECT.
    

    // Press the PLAY button in the top left to RUN THE PROGRAM!!
}


// next let's define a new method called turnLeft
// remember the syntax: - (void) name { CODE CODE CODE }

// then think about what the code would be
// how might we turnLeft if we only know how to turnRight?








// now try executing our new method from inside the run method

// do you know why it's not working?  the computer reads top to bottom
// when it reads the code in run, it doesn't know what turnLeft is yet.
// move the method to right above RUN and try again

@end

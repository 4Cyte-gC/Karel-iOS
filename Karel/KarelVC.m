//
//  Karel.m
//  Karel
//
//  Created by Zach Weiner on 9/21/12.
//  Copyright (c) 2012 Giving Turtle. All rights reserved.
//

#import "KarelVC.h"

#define UNIT_SIZE 32

@interface KarelVC ()

// Views
@property (weak, nonatomic) IBOutlet UIImageView *karelView;
@property (strong, nonatomic) NSMutableArray *beeperViews;

// the following constitutes KarelWorld, the model
@property (strong, nonatomic) NSMutableSet* beepers;

@property int x;
@property int y;
@property int xDir;
@property int yDir;

@end


@implementation KarelVC


#pragma mark Program to run

- (void) run {
    // no-op by default
}

#pragma mark User Interface
     
- (void) draw {
    // pause
    usleep(400000);
    
    // 0. remove all beepers
    for (UIView *view in self.beeperViews) {
        [view removeFromSuperview];
    }
    
    [self.beeperViews removeAllObjects];
    
    // 1. put beepers at their places    
    for(NSArray *arr in self.beepers) {
        UIImageView *beeper = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"beeper.png"]];
        [self.beeperViews addObject:beeper];
        [self.view addSubview:beeper];
        int x = [(NSNumber *)[arr objectAtIndex:0] intValue];
        int y = [(NSNumber *)[arr objectAtIndex:1] intValue];
        
        beeper.center = CGPointMake(x * UNIT_SIZE, y * UNIT_SIZE);
    }
    
    // 2. put karel at x, y, rotated correctly
    CGFloat transform = 0.0;
    if(self.yDir == -1) transform = -M_PI_2;
    else if(self.xDir == -1) transform = M_PI;
    else if(self.yDir == 1) transform = M_PI_2;
    self.karelView.transform = CGAffineTransformMakeRotation(transform);
    self.karelView.hidden = FALSE;
    self.karelView.center = CGPointMake(self.x * UNIT_SIZE, self.y * UNIT_SIZE);
    [self.view bringSubviewToFront:self.karelView];
    
    // 3. force a redraw as per http://stackoverflow.com/questions/5408234/how-to-force-a-view-to-render-itself
    [self.view setNeedsDisplay];
    [[NSRunLoop currentRunLoop] runMode: NSDefaultRunLoopMode beforeDate: [NSDate date]];
}

- (IBAction)moveButton:(id)sender {
    [self move];
}

- (IBAction)turnRightButton:(id)sender {
    [self turnRight];
}

- (IBAction)pickBeeperButton:(id)sender {
    [self pickBeeper];
}

- (IBAction)putBeeperButton:(id)sender {
    [self putBeeper];
}



#pragma mark commands

- (void) move {
    NSLog(@"move");
    self.x += self.xDir;
    self.y += self.yDir;
    
    [self draw];
}

- (void) turnRight {  
    NSLog(@"right");
    if(self.xDir == 1) {
        // facing right
        self.xDir = 0;
        self.yDir = 1;
    } else if (self.yDir == 1) {
        // facing down
        self.xDir = -1;
        self.yDir = 0;
    } else if(self.xDir == -1) {
        // facing left
        self.xDir = 0;
        self.yDir = -1;
    } else if(self.yDir == -1) {
        // facing up
        self.xDir = 1;
        self.yDir = 0;
    }
    
    [self draw];
}

- (NSArray*) locationAsArray {
    return [NSArray arrayWithObjects:
            [NSNumber numberWithInt:self.x],
            [NSNumber numberWithInt:self.y],
            nil];
}

- (void) putBeeper {
    NSLog(@"Put beeper");
    [self.beepers addObject: [self locationAsArray]];
    [self draw];
}

- (void) pickBeeper {
    NSLog(@"Pick beeper");
    [self.beepers removeObject: [self locationAsArray]];
    [self draw];
}

#pragma mark model code

@synthesize karelView = _karelView;
@synthesize beeperViews = _beeperViews;
@synthesize beepers=_beepers;
@synthesize x=_x;
@synthesize y=_y;
@synthesize xDir=_xDir;
@synthesize yDir=_yDir;

- (NSMutableArray*) beeperViews {
    if(!_beeperViews) {
        _beeperViews = [NSMutableArray array];
    }
    return _beeperViews;
}

- (NSMutableSet*) beepers {
    if(!_beepers) {
        _beepers = [NSMutableSet set];
    }
    return _beepers;
}

- (void) viewDidAppear:(BOOL)animated {
    self.xDir = 1;
    self.yDir = 0;
    self.x = 1;
    self.y = 1;
    [self draw];
    [self run];
}

- (void)viewDidUnload {
    [self setKarelView:nil];
    [self setKarelView:nil];
    [super viewDidUnload];
}
@end

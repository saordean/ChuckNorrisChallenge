//
//  ViewController.m
//  ChuckNorrisChallenge
//
//  Created by JerryTaylorKendrick on 5/5/13.
//  Copyright (c) 2013 DeanAMH. All rights reserved.
//

#import "ViewController.h"
#import "JokeViewController.h"


// Preferred networking framework for URL processing
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize fliteController;
@synthesize slt;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // The following code is added to allow swipe recognition int the Guessingcat View Controller:
    //    - Right Swipe for next view (JokeViewController)
    //    - Left Swipe no action
    //    - Up Swipe - no action
    //    - Down Swipt - no action
    
    self.swipeJokesLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeHandler:)];
    self.swipeJokesLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    // I think the line below accomplishes the same as above (?)
    //[_swipeJokesLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:self.swipeJokesLeft];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getJokeButton:(id)sender {
    JokeViewController *jokeViewController = [[JokeViewController alloc] initWithNibName:@"JokeViewController" bundle:nil];
    [self.navigationController pushViewController:jokeViewController animated:YES];
}


- (void) leftSwipeHandler:(UIGestureRecognizer *) recognizer {
    //NSLog(@"leftSwipeHandler method entered");
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) recognizer direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionUp:
            //NSLog(@"up");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            //NSLog(@"down");
            break;
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"right");
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"left");
            JokeViewController *jokeViewController =[[JokeViewController alloc]  initWithNibName:@"JokeViewController" bundle:nil];
            [self.navigationController pushViewController:jokeViewController animated:YES];
            break;
        }
}


// ***********************************************************************************************
// * The Following two methods implement the "Lazy" getters used by the Open Ears TTS Framework  *
// ***********************************************************************************************
- (FliteController *)fliteController {
	if (fliteController == nil) {
		fliteController = [[FliteController alloc] init];
	}
	return fliteController;
}


- (Slt *)slt {
	if (slt == nil) {
		slt = [[Slt alloc] init];
	}
	return slt;
}



@end

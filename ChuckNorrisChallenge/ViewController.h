//
//  ViewController.h
//  ChuckNorrisChallenge
//
//  Created by JerryTaylorKendrick on 5/5/13.
//  Copyright (c) 2013 DeanAMH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Joke.h"
#import <Slt/Slt.h>
#import <OpenEars/FliteController.h>

@interface ViewController : UIViewController<UIAlertViewDelegate, UITableViewDataSource>

// Added to support the Open Ears TTS framework
@property (strong, nonatomic) FliteController *fliteController;
@property (strong, nonatomic) Slt *slt;

// Added to handle the get joke button
- (IBAction)getJokeButton:(id)sender;

// Added to allow for swiping
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeJokesLeft;
- (void) leftSwipeHandler:(UIGestureRecognizer *) recognizer;

// Added to provide an outlet to the joke image
@property (strong, nonatomic) IBOutlet UIImageView  *jokeImage;

@end

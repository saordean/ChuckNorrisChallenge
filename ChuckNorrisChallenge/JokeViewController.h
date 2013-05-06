//
//  JokeViewController.h
//  ChuckNorrisChallenge
//
//  Created by JerryTaylorKendrick on 5/5/13.
//  Copyright (c) 2013 DeanAMH. All rights reserved.
//

#import "ViewController.h"
#import "Joke.h"


@interface JokeViewController : ViewController<UIAlertViewDelegate, UITableViewDataSource>

// Added to support the Open Ears TTS framework
@property (strong, nonatomic) FliteController *fliteController;
@property (strong, nonatomic) Slt *slt;

// Added to allow for swiping
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeJokesRight;
- (void) rightSwipeHandler:(UIGestureRecognizer *) recognizer;

// Outlets for the joke text and joke image
@property (strong, nonatomic) IBOutlet UILabel *jokeText;
@property (strong, nonatomic) IBOutlet UIImageView *jokeImage;

@end

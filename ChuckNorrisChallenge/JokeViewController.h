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
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeJokesLeft;
- (void) leftSwipeHandler:(UIGestureRecognizer *) recognizer;

// Added for the table view that holds old jokes
@property (nonatomic, strong) IBOutlet UITableView *oldJokesTableView;

@end

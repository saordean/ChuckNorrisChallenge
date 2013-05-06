//
//  JokeViewController.m
//  ChuckNorrisChallenge
//
//  Created by JerryTaylorKendrick on 5/5/13.
//  Copyright (c) 2013 DeanAMH. All rights reserved.
//

#import "JokeViewController.h"
#import "AFNetworking.h"
#import <UIKit/UIKit.h>

@interface JokeViewController ()

@property (strong, nonatomic) NSString *phrase;

@property (nonatomic, strong) NSArray *jokes;

@end

@implementation JokeViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.swipeJokesRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeHandler:)];
    self.swipeJokesRight.direction = UISwipeGestureRecognizerDirectionRight;
    // I think the line below accomplishes the same as above (?)
    //[_swipeJokesLeft setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:self.swipeJokesRight];
    
    // Set the title of the view toolbar, and the text on the back button
    self.title = @"Current joke";
    
    //NSArray *toolbarStuff = [[NSArray alloc] initWithObjects:@"junk",@"junk",@"junk",nil];
    //[self setToolbarItems:toolbarStuff animated:YES];
    
    // Pass the URL to the method that will return a randowm Chuck Norris joke"
    _phrase = [[Joke alloc] isFoundAt:@"http://api.icndb.com/jokes/random/" ];
 
    
    // Set the custom font for the label: jokeText
    UIFont *newFont = [UIFont fontWithName:@"celticmd" size:14];
    _jokeText.font = newFont;
    
    // Remove occurrences of the string: "&quot" since it isn't spoken or displayed well
    _phrase = [_phrase stringByReplacingOccurrencesOfString:@"&quot" withString:@""];
    
    // Display the joke in the JokeText label
    _jokeText.text = _phrase;
    
    // Display the joke on the console
    //NSLog(@"%@", _phrase);

    
    // Extract a random noun from the joke to be used as a search argument for the
    // Flickr JSON interface
    
    NSString *randomNoun = [[Joke alloc  ] hadNounIn:_phrase];
    
    NSLog(@"The noun to be used for searching Flickr photos is:%@", randomNoun);
    
    //_jokeImageURL = [[JokeImage alloc] isFoundWith:randomNoun];
    _jokeImageURL = nil;
    
    if (_jokeImageURL != nil) {

       // Set the UIImageView to the value of the image whose URL was returned from ths search
        
        // For testing
        //NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://www.myurl.net/test.jpg"]];
       
        //NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:_jokeImageURL]];
       // Set UIImageView image to be the image acquired from the  URL
       //UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
       //_jokeImageView.image = image;
    }
    
    // Speak the joke using the TTS framework
    [self.fliteController say:_phrase withVoice:self.slt];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) rightSwipeHandler:(UIGestureRecognizer *) recognizer {
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) recognizer direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionUp:
            //NSLog(@"up");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            //NSLog(@"down");
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            //NSLog(@"left");
            // The statements below are found in the ViewController.m for this application and allow this veiw to be
            // reached via a right swipe
            //NSLog(@"left");
            //JokeViewController *jokeViewController = [[JokeViewController alloc]  initWithNibName:@"JokeViewController"
            //                                                                               bundle:nil];
            //[self.navigationController pushViewController:jokeViewController animated:YES];
            break;
        case UISwipeGestureRecognizerDirectionRight:
            [self.navigationController popViewControllerAnimated:YES];
            break;
    }
}


@end

//
//  JokeViewController.m
//  ChuckNorrisChallenge
//
//  Created by JerryTaylorKendrick on 5/5/13.
//  Copyright (c) 2013 DeanAMH. All rights reserved.
//

#import "JokeViewController.h"
#import "AFNetworking.h"

@interface JokeViewController ()

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
    
    self.swipeJokesLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeHandler:)];
    self.swipeJokesLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    // I think the line below accomplishes the same as above (?)
    //[_swipeJokesLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:self.swipeJokesLeft];
    
    self.title = @"Last Ten Chuck Norris Jokes";
    
    [self.oldJokesTableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) jokeImageSearch:(NSString *)searchWord {
    /*
     // All variables required
     NSString *unencodedUrl = [NSString alloc];
     unencodedUrl = @"http://www.flickr.com";
     NSString *encodedString = [unencodedUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
     NSURL         *imageUrl = [NSURL URLWithString:encodedString];
     NSURLRequest  *request = [NSURLRequest requestWithURL:imageUrl];
     NSURLRequest  *theRequest = [NSURLRequest requestWithURL:imageUrl];
     NSURLResponse *resp = nil;
     NSError *err = nil;
     
     NSURLConnection *response = [NSURLConnection sendSynchronousRequest: theRequest returningResponse: &resp error: &err];
     if (response == nil) {
     NSLog(@"The was problem accessing the Flickr imaage data, try again");
     }
     
     [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
     
     AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
     // Success Block code, this code is executed when a web service call is successful
     NSLog(@"%@", JSON);
     } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
     // Failure Block code, his code is executed when a web service call doesn't work.
     NSLog(@"Web image search failed: %@", error);
     
     }];
     [operation start];
     */
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    id cellJoke = self.jokes[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",cellJoke];
    return cell;
}



// Compensates for the Table View cell size
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95.0;
}




- (void) leftSwipeHandler:(UIGestureRecognizer *) recognizer {
    UISwipeGestureRecognizerDirection direction = [(UISwipeGestureRecognizer *) recognizer direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"up");
            break;
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"down");
            break;
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"left");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case UISwipeGestureRecognizerDirectionRight:
            // The statements below are found in the ViewController.m for this application and allow this veiw to be
            // reached via a right swipe
            //NSLog(@"right");
            //JokeViewController *jokeViewController = [[JokeViewController alloc]  initWithNibName:@"JokeViewController"
            //                                                                               bundle:nil];
            //[self.navigationController pushViewController:jokeViewController animated:YES];
            break;
    }
}


@end

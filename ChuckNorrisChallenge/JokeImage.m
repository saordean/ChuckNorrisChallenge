//
//  JokeImage.m
//  ChuckNorrisChallenge
//
//  Created by JerryTaylorKendrick on 5/6/13.
//  Copyright (c) 2013 DeanAMH. All rights reserved.
//


#import "JokeImage.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"


@interface JokeImage()

@property (strong, nonatomic) UIImage      *relatedImage;
@property (strong, nonatomic) NSString     *location;
@property (strong, nonatomic) NSString     *key;
@property (strong, nonatomic) NSData       *response;
@property (strong, nonatomic) NSURLRequest *theRequest;
@property (strong, nonatomic) NSURLRequest *request;
@property (strong, nonatomic) NSURL        *imageUrl;
@property (strong, nonatomic) NSData       *imageData;;
@property (strong, nonatomic) UIImageView  *jokeImage;
@property (weak, nonatomic)   NSString     *flickrURL;

//-(UIImage *) getsImage:(NSString *)imageUrlString;

@end


@implementation JokeImage


-(NSString *) isFoundWith:(NSString *)searchParameter {
    
    /* URL string for Flickr JSON based images
       @"http://flickr.com/random";
       http://api.flickr.com/services/rest/?format=json&method=flickr.photosets.getPhotos&photoset_id=THESET&per_page=10&page=1&api_key=XXX&jsoncallback=?
    
     
       Issue an URL to a flickr JSON site with the key= to find an imaage to go with the joke
     
       Flickr Key = a7d035d2622c9802a3179ef702b60538
     
       Flickr Key Challenge = 49c6e5721b1cc049
    */
    NSString *key = @"a7d035d2622c9802a3179ef702b60538";
    _flickrURL = [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?format=json&method=flickr.photosets.getPhotos&photoset_id=THESET&per_page=10&page=1&api_key=%@&jsoncallback=?", key];
    
    // URL string in encoded format
    NSString *encodedString = [_flickrURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // All variables required for the AFSJSONRequestOperation method
    _imageUrl = [NSURL URLWithString:encodedString];
    _request = [NSURLRequest requestWithURL:_imageUrl];
    _theRequest = [NSURLRequest requestWithURL:_imageUrl];
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    //NSData *response = [NSURLConnection sendSynchronousRequest: theRequest returningResponse: &resp error: &err];
    _response = [NSURLConnection sendSynchronousRequest: _theRequest returningResponse: &resp error: &err];
    if (_response == nil) {
        NSLog(@"The was problem accessing the Chuck Norris Random joke data, try again");
    }
    /*  It was learned from error messages that the only content types accepted  by the site are:
     stated to be:
     "text/json",
     "application/json",
     "text/javascript"
     however only:
     "text/html"
     works.
     */
    
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:self.request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        // Success Block code.  This code is executed when a web service call is successful
        NSLog(@"Successful AFSONRequestOperation call");
        //NSLog(@"%@", JSON);
        // Turn progress indicator off
        //[MBProgressHUD hideHUDForView:self.view animated:YES];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        // Failure Block code.  This code is executed when a web service call doesn't work.
        NSLog(@"An AFJSON request error occurred: %@", error);
        // Turn progress indicator off
        //[MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    [operation start];
    
    /*
     
     Example JSON data format from the Flick image site ( http://api.icndb.com/jokes/random ) :
     
     { "type": "success", "value":
     
     { "id": 207,
     "joke": "It is believed dinosaurs are extinct due to a giant meteor. That's true if you want to call Chuck Norris a giant meteor.",
     "categories": []
     }
     }
     
     */
    
    NSString *imageLocation = @"";
    NSDictionary *jsonArray=[NSJSONSerialization JSONObjectWithData:_response options:NSJSONReadingMutableContainers error:&err];
    if (!jsonArray) {
        imageLocation = nil;
        NSLog(@"Error parsing JSON data: %@", err);
    } else {
        imageLocation = [jsonArray valueForKeyPath:@"value.image"];
    }
    
    return imageLocation;
}



@end

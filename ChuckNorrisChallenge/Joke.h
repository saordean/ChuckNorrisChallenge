//
//  Joke.h
//  ChuckNorrisChallenge
//
//  Created by JerryTaylorKendrick on 5/5/13.
//  Copyright (c) 2013 DeanAMH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Joke : NSObject

-(NSString *) isFoundAt:(NSString *)url;
-(NSString *) hadNounIn:(NSString *)sourceString;

@end

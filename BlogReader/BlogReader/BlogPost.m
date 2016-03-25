//
//  BlogPost.m
//  BlogReader
//
//  Created by Larissa Boatwright on 3/25/16.
//  Copyright © 2016 Jordin Marshall. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

-(id) initWithTitle:(NSString *)__cdata;{
    self = [super init];
    
    if(self){
        self.__cdata= __cdata;
    }
    return self;
}

+(id) blogPostWithTitle:(NSString *)__cdata{
    return [[self alloc] initWithTitle:__cdata];
}

-(NSString *) formattedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-mm-dd"];
    
    NSDate *tempdate = [dateFormatter dateFromString:self.date];
    
    [dateFormatter setDateFormat:@"EE MMM,dd"];
    return [dateFormatter stringFromDate:tempdate];
}

@end

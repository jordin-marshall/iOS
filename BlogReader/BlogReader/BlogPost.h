//
//  BlogPost.h
//  BlogReader
//
//  Created by Larissa Boatwright on 3/25/16.
//  Copyright © 2016 Jordin Marshall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject
@property (nonatomic, strong) NSString *__cdata;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSURL *url;

//Designated Initializer
-(id) initWithTitle:(NSString *)__cdata;
+(id) blogPostWithTitle:(NSString *)__cdata;

-(NSString *) formattedDate;
@end

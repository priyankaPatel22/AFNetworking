//
//  Counts.h
//  Gosaic
//
//  Created by Infinium on 22/05/13.
//  Copyright (c) 2013 Darshan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFAppDotNetAPIClient.h"

@interface API : NSObject
+ (void)userLogin:(NSDictionary *)params withBlocks:(void (^)(NSDictionary *response, NSError *error))block;
+ (void)userRegister:(NSDictionary *)params withBlocks:(void (^)(NSDictionary *response, NSError *error))block;
@end

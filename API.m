//
//  Counts.m
//  Gosaic
//
//  Created by Infinium on 22/05/13.
//  Copyright (c) 2013 Darshan. All rights reserved.
//

#import "API.h"

@implementation API

+ (void)userLogin:(NSDictionary *)params withBlocks:(void (^)(NSDictionary *response, NSError *error))block
{
    [[AFAppDotNetAPIClient sharedClient] postPath:@"login" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        
        if (!error) {
            if (block) {
                block(json,nil);
            }
        }else
        {
            block(json,error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (block) {
            block(nil,error);
        }
    }];
}
+ (void)userRegister:(NSDictionary *)params withBlocks:(void (^)(NSDictionary *response, NSError *error))block
{
    [[AFAppDotNetAPIClient sharedClient] postPath:@"register" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
        
        if (!error) {
            if (block) {
                block(json,nil);
            }
        }else
        {
            block(json,error);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (block) {
            block(nil,error);
        }
    }];
}

@end

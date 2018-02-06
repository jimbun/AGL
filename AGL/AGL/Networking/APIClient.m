//
//  APIClient.m
//  13CABS
//
//  Created by 13CABS on 31/03/2015.
//  Copyright (c) 2015 13CABS. All rights reserved.
//

#import "APIClient.h"

static NSString * const BaseURL = @"https://agl-developer-test.azurewebsites.net/";

@implementation APIClient

+ (instancetype)sharedClient{
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        //initiate shared api client object
        _sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:BaseURL]];
        //set security policy
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end

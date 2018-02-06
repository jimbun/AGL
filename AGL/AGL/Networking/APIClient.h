//
//  APIClient.h
//  13CABS
//
//  Created by 13CABS on 31/03/2015.
//  Copyright (c) 2015 13CABS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"



@interface APIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

//
//  HttpPeople.m
//  AGL
//
//  Created by Jim Bun on 5/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import "HttpPeople.h"
#import "APIClient.h"


@implementation HttpPeople
+ (NSURLSessionDataTask *)listPeopleWithBlock:(void (^)(ListPerson *listPerson, NSError *error))block{
    return [[APIClient sharedClient]
            GET:@"people.json"
            parameters:nil
            progress:nil
            success:^(NSURLSessionDataTask * __unused task, id JSON) {
                if (block) {
                    block([[ListPerson alloc] initWithListPeople:(NSArray *)JSON], nil);
                }
            } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
                if (block) {
                    block(nil, error);
                }
            }];
}
@end

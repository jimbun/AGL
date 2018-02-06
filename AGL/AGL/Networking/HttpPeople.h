//
//  HttpPeople.h
//  AGL
//
//  Created by Jim Bun on 5/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListPerson.h"


@interface HttpPeople : NSObject

+ (NSURLSessionDataTask *)listPeopleWithBlock:(void (^)(ListPerson *listPeron, NSError *error))block;
@end

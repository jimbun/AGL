//
//  ListPerson.h
//  AGL
//
//  Created by Jim Bun on 4/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface ListPerson : NSObject 

/*!
 * Initializes a list of people instance with array of people info.
 *
 * \param list
 * list of people
 *
 */
- (instancetype) initWithListPeople:(NSArray*)list;

/*!
 * returns
 * A copy of the list people.
 *
 */
@property (copy, readonly) NSArray *list;

/*!
 * returns
 * The number of people in the list.
 */
@property (readonly) NSInteger count;

/*!
 * returns
 * YES if the list has no people, NO otherwise.
 */
@property (readonly, getter=isEmpty) BOOL empty;

/*!
 * Filter list poeple with a pet type "Fish | Dog | Cat"
 *
 * \param type
 * type of pet the people need to have
 *
 * returns
 * A copy of list of people that have selected pet type
 */
- (NSArray*)filterListWithPetType:(NSString*)type;


@end

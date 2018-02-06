//
//  Pet.h
//  AGL
//
//  Created by Jim Bun on 4/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject<NSCopying>

/*!
 * Initializes a Pet instance with name and type.
 *
 * \param name
 * The pet's name.
 *
 * \param type - {'Cat', 'Dog', 'Fish'}
 * The type of pet.
 *
 */
- (instancetype)initWithName:(NSString *)name type:(NSString*)type;

- (instancetype)initWithAttributes:(NSDictionary*)attributes;

/*!
 * The Pet's name.
 */
@property (nonatomic, copy) NSString* name;

/*!
 * The Pet's type.
 */
@property (nonatomic, copy) NSString* type;

@end


@interface ListPets:NSObject<NSCopying>

/*!
 * Initializes pet list instance with pets.
 *
 * \param listPets
 * The pets to be added into list.
 *
 */
- (instancetype)initWithListPets:(NSArray*)listPets;

/*!
 * The Pet's list.
 */
@property (readwrite, copy) NSArray* list;

/*!
 * returns
 * The number of pets in the list.
 */
@property (readonly) NSInteger count;

@property (readonly, getter=isEmpty) BOOL empty;

/*!
 * Filter pet list with a pet type "Fish | Dog | Cat"
 *
 * \param type
 * type of pet
 *
 * returns
 * List of pets belong to the person with selected type
 */
- (NSArray*)filterListWithType:(NSString*)type;

/*!
 * Sort pet's list by name
 *
 * \param acending
 * "YES" to ordered by accending, otherwise "NO"
 *
 * returns
 * List of pets sorted by name
 */
- (void)sortByNameOrderedAcending:(BOOL)acending;

@end

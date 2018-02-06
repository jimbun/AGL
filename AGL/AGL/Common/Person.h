//
//  Person.h
//  AGL
//
//  Created by Jim Bun on 4/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListPets.h"

@interface Person : NSObject <NSCopying>

/*!
 * Initializes a Person instance with name, gender, age and pets.
 *
 * \param name
 * The name of the person.
 *
 * \param gender
 * The gender of the person.
 *
 * \param age
 * The age of the person.
 *
 * \param listPets
 * The pets belog to the person.
 */
- (instancetype)initWithName:(NSString *)name gender:(NSString*)gender age:(NSInteger)age listPets:(ListPets *)listPets;

/*!
 * Initializes a Person instance with person's attributes.
 * The attributes is usually JSON object retreive from server
 *
 * \param attributes
 * The name of the person.
 *
 */
- (instancetype)initWithAttributes:(NSDictionary*)attributes;

/*!
 * The Person's name.
 */
@property (nonatomic, copy) NSString* name;

/*!
 * The Person's gender.
 */
@property (nonatomic, copy) NSString* gender;

/*!
 * The Person's age.
 */
@property (nonatomic, assign) NSUInteger age;

/*!
 * All pets belong to the person.
 */
@property (readwrite, copy) ListPets* listPets;

/*!
 * To test if the person is have any particular pet
 *
 * \param type
 * The type of pet to look for
 *
 */
- (BOOL)havePetsWithType:(NSString*)type;

@end

//
//  AGLListPets.m
//  AGLTests
//
//  Created by Jim Bun on 6/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListPets.h"

@interface AGLListPets : XCTestCase

@end

@implementation AGLListPets

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Initializers

- (void)testConvenienceAttributesPetInit{
    NSDictionary* petAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom", @"name", @"Cat", @"type", nil];
    Pet* pet = [[Pet alloc] initWithAttributes:petAttributes];
    XCTAssertEqualObjects(pet.name, @"Tom");
    XCTAssertEqualObjects(pet.type, @"Cat");
}

- (void)testConvenienceNameAndTypePetInit{
    
    NSString* name = @"abc";
    NSString* type = @"snake";
    
    Pet* pet = [[Pet alloc] initWithName:name type:type];
    XCTAssertEqualObjects(pet.name, name);
    XCTAssertEqualObjects(pet.type, type);
}

#pragma mark - NSCopying

- (void)testCopyingPet {
    Pet* pet = [[Pet alloc] initWithName:@"John" type:@"Dog"];
    Pet* clonePet = [pet copy];
    XCTAssertEqualObjects(pet.name, clonePet.name);
    
    clonePet.name = @"Clone";
    XCTAssertNotEqual(pet.name, clonePet.name);
}

#pragma mark - Initializers

- (void)testConvenienceAttributesListPetsInit{
    
    NSDictionary* pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom", @"name", @"Cat", @"type", nil];
    NSDictionary* pet2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Lisa", @"name", @"Lizard", @"type", nil];
    NSDictionary* pet3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jerry", @"name", @"Cat", @"type", nil];
    NSDictionary* pet4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jenny", @"name", @"Fish", @"type", nil];
    NSDictionary* pet5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jerry", @"name", @"Cat", @"type", nil];
    NSArray *list = [[NSArray alloc] initWithObjects:pet1, pet2, pet3, pet4, pet5, nil];
    
    ListPets* listPets = [[ListPets alloc] initWithListPets:list];
    
    Pet* p1 = (Pet*)[listPets.list objectAtIndex:0];
    XCTAssertEqualObjects(p1.name, @"Tom");
    XCTAssertEqualObjects(p1.type, @"Cat");
    Pet* p2 = (Pet*)[listPets.list objectAtIndex:3];
    XCTAssertEqualObjects(p2.name, @"Jenny");
    XCTAssertEqualObjects(p2.type, @"Fish");
    Pet* p3 = (Pet*)[listPets.list objectAtIndex:4];
    XCTAssertEqualObjects(p3.name, @"Jerry");
    XCTAssertEqualObjects(p3.type, @"Cat");
}

- (void)testCount{
    
    NSDictionary* pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom", @"name", @"Cat", @"type", nil];
    NSDictionary* pet2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Lisa", @"name", @"Lizard", @"type", nil];
    NSArray* pets = [[NSArray alloc] initWithObjects:pet1, pet2, nil];
    ListPets* listPets = [[ListPets alloc] initWithListPets:pets];
    XCTAssertEqual(listPets.count, 2);
}

- (void)testIsEmpty{
    
    NSDictionary* pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom", @"name", @"Cat", @"type", nil];
    NSDictionary* pet2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Lisa", @"name", @"Lizard", @"type", nil];
    NSArray* list = [[NSArray alloc] initWithObjects:pet1, pet2, nil];
    
    ListPets* listPets = [[ListPets alloc] init];
    XCTAssertTrue(listPets.isEmpty);
    
    listPets = [[ListPets alloc] initWithListPets:list];
    XCTAssertFalse(listPets.isEmpty);
}

- (void)testFilterListWithType{
    NSDictionary* pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom", @"name", @"Cat", @"type", nil];
    NSDictionary* pet2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Lisa", @"name", @"Lizard", @"type", nil];
    NSDictionary* pet3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jerry", @"name", @"Cat", @"type", nil];
    NSDictionary* pet4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jenny", @"name", @"Fish", @"type", nil];
    NSDictionary* pet5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jerry", @"name", @"Cat", @"type", nil];
    NSArray *list = [[NSArray alloc] initWithObjects:pet1, pet2, pet3, pet4, pet5, nil];
    
    ListPets *listPets = [[ListPets alloc] initWithListPets:list];
    
    NSArray* listCats = [listPets filterListWithType:@"Cat"];
    XCTAssertEqual(listCats.count, 3);
    
    Pet* p1 = [listCats objectAtIndex:0];
    XCTAssertEqualObjects(p1.type, @"Cat");
    Pet* p2 = [listCats objectAtIndex:1];
    XCTAssertEqualObjects(p2.type, @"Cat");
    Pet* p3 = [listCats objectAtIndex:2];
    XCTAssertEqualObjects(p3.type, @"Cat");
}

- (void)testSortByNameWithPetType{
    NSDictionary* pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom", @"name", @"Cat", @"type", nil];
    NSDictionary* pet2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jerry", @"name", @"Cat", @"type", nil];
    NSDictionary* pet3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Lisa", @"name", @"Cat", @"type", nil];

    NSArray *list = [[NSArray alloc] initWithObjects:pet1, pet2, pet3, nil];
    
    ListPets *listPets = [[ListPets alloc] initWithListPets:list];
    [listPets sortByNameOrderedAcending:YES];
    Pet* p1 = (Pet*)[listPets.list objectAtIndex:0];
    XCTAssertEqualObjects(p1.name, @"Jerry");
    
    p1 = (Pet*)[listPets.list objectAtIndex:0];
    [listPets sortByNameOrderedAcending:NO];
    XCTAssertEqualObjects(p1.name, @"Jerry");
}





@end

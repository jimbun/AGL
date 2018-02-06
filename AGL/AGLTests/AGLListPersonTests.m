//
//  AGLListPersonTests.m
//  AGLTests
//
//  Created by Jim Bun on 6/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ListPerson.h"

@interface AGLListPersonTests : XCTestCase
//@property (nonatomic, strong) ListPerson* listPerson;
@end

@implementation AGLListPersonTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Initializers
- (void)testConvenieceListPeopleInit {
    
    //person 1
    NSDictionary* p1Pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom",@"name", @"Cat", @"type", nil];
    NSDictionary* p1Pet2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Andy",@"name", @"Cat", @"type", nil];
    NSDictionary* p1Pet3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jerry",@"name", @"Cat", @"type", nil];
    NSDictionary* person1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jo", @"name", @"Male", @"gender",
                             [NSNumber numberWithInt:26], @"age", [[NSArray alloc] initWithObjects:p1Pet1, p1Pet2, p1Pet3, nil], @"pets", nil];
    
    //person 2
    NSDictionary* p2Pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"a",@"name", @"Snake", @"type", nil];
    NSDictionary* person2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jane", @"name", @"Female", @"gender",
                             [NSNumber numberWithInt:21], @"age", [[NSArray alloc] initWithObjects:p2Pet1, nil], @"pets", nil];
    
    NSArray* list = [[NSArray alloc] initWithObjects:person1, person2, nil];
    
    ListPerson* listPerson = [[ListPerson alloc] initWithListPeople:list];
    XCTAssertEqual(listPerson.list.count, 2);
    
    Person* p1 = (Person*)[listPerson.list objectAtIndex:0];
    XCTAssertEqualObjects(p1.name, @"Jo");
    XCTAssertEqualObjects(p1.gender, @"Male");
    XCTAssertEqual(p1.age, 26);
    XCTAssertEqual(p1.listPets.count, 3);
    
    Person* p2 = (Person*)[listPerson.list objectAtIndex:1];
    XCTAssertEqualObjects(p2.name, @"Jane");
    XCTAssertEqualObjects(p2.gender, @"Female");
    XCTAssertEqual(p2.age, 21);
    XCTAssertEqual(p2.listPets.count, 1);
}

- (void)testCount{
    //    person 1
    NSDictionary* p1Pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom",@"name", @"Cat", @"type", nil];
    NSDictionary* person1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jo", @"name", @"Male", @"gender",
                             [NSNumber numberWithInt:26], @"age", [[NSArray alloc] initWithObjects:p1Pet1, nil], @"pets", nil];
    NSArray* list = [[NSArray alloc] initWithObjects:person1, nil];
    ListPerson* listPerson = [[ListPerson alloc] initWithListPeople:list];
    XCTAssertEqual(listPerson.count, 1);
}

- (void)testIsEmpty{
    
    ListPerson* listPerson = [[ListPerson alloc] init];
    XCTAssertTrue(listPerson.isEmpty);
    
//  person 1
    NSDictionary* p1Pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom",@"name", @"Cat", @"type", nil];
    NSDictionary* person1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jo", @"name", @"Male", @"gender",
                             [NSNumber numberWithInt:26], @"age", [[NSArray alloc] initWithObjects:p1Pet1, nil], @"pets", nil];
    NSArray* list = [[NSArray alloc] initWithObjects:person1, nil];
    listPerson = [[ListPerson alloc] initWithListPeople:list];
    XCTAssertFalse(listPerson.isEmpty);
}

- (void)testFilterPeopleByPetType{
    //person 1
    NSDictionary* p1Pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tom",@"name", @"Cat", @"type", nil];
    NSDictionary* p1Pet2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Andy",@"name", @"Cat", @"type", nil];
    NSDictionary* p1Pet3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jerry",@"name", @"Cat", @"type", nil];
    NSDictionary* p1Pet4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Mark",@"name", @"Lizard", @"type", nil];
    NSDictionary* person1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jo", @"name", @"Male", @"gender",
                             [NSNumber numberWithInt:26], @"age", [[NSArray alloc] initWithObjects:p1Pet1, p1Pet2, p1Pet3, p1Pet4,nil], @"pets", nil];
    
    //person 2
    NSDictionary* p2Pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"a",@"name", @"Snake", @"type", nil];
    NSDictionary* person2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jane", @"name", @"Female", @"gender",
                             [NSNumber numberWithInt:21], @"age", [[NSArray alloc] initWithObjects:p2Pet1, nil], @"pets", nil];
    
    NSArray* list = [[NSArray alloc] initWithObjects:person1, person2, nil];
    
    ListPerson* listPerson = [[ListPerson alloc] initWithListPeople:list];
    XCTAssertEqual(listPerson.count, 2);
    
    NSArray* filteredList = [listPerson filterListWithPetType:@"Cat"];
    XCTAssertEqual(filteredList.count, 1);
    Person* person = (Person*)[filteredList objectAtIndex:0];
    XCTAssertEqualObjects(person.name, @"Jo");
    XCTAssertEqualObjects(person.gender, @"Male");
}

@end

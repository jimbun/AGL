//
//  AGLTests.m
//  AGLTests
//
//  Created by Jim Bun on 1/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"
#import "ListPets.h"

@interface AGLPersonTests : XCTestCase
@property (nonatomic, strong) Person *person;
@end

@implementation AGLPersonTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //person 2
    NSDictionary* p2Pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"a",@"name", @"Snake", @"type", nil];
    NSDictionary* person2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jane", @"name", @"Female", @"gender",
                             [NSNumber numberWithInt:21], @"age", [[NSArray alloc] initWithObjects:p2Pet1, nil], @"pets", nil];
    
    _person = [[Person alloc] initWithAttributes:person2];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - Initializers

- (void)testConvenieceAttributesInit {
    
    //person 1
    NSDictionary* p1Pet1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"a",@"name", @"Dog", @"type", nil];
    NSDictionary* p1Pet2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"b",@"name", @"Cat", @"type", nil];
    NSDictionary* person1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Jo", @"name", @"Male", @"gender",
                             [NSNumber numberWithInt:26], @"age", [[NSArray alloc] initWithObjects:p1Pet1, p1Pet2, nil], @"pets", nil];
    Person *person = [[Person alloc] initWithAttributes:person1];
    
    XCTAssertEqualObjects(person.name, @"Jo");
    XCTAssertEqualObjects(person.gender, @"Male");
    XCTAssertEqual(person.age, 26);
    XCTAssertEqualObjects(((Pet*)[person.listPets.list objectAtIndex:0]).name , @"a");
    XCTAssertEqualObjects(((Pet*)[person.listPets.list objectAtIndex:0]).type , @"Dog");
    XCTAssertEqualObjects(((Pet*)[person.listPets.list objectAtIndex:1]).name , @"b");
    XCTAssertEqualObjects(((Pet*)[person.listPets.list objectAtIndex:1]).type , @"Cat");
    
}

- (void)testConvenienceFullPropertiesInit {
    NSString* name = @"Jo";
    NSString* gender = @"Male";
    NSInteger age = 25;

    NSArray* pets = [[NSArray alloc] initWithObjects:
                     [[Pet alloc] initWithName:@"a"
                                          type:@"Dog"],
                     [[Pet alloc] initWithName:@"b"
                                          type:@"Cat"], nil];
    
    Person *person = [[Person alloc] initWithName:name gender:gender age:age listPets:[[ListPets alloc] initWithListPets:pets]];
    
    XCTAssertEqualObjects(person.name, name);
    XCTAssertEqualObjects(person.gender, gender);
    XCTAssertEqual(person.age, age);
    XCTAssertEqualObjects(((Pet*)[person.listPets.list objectAtIndex:0]).name , @"a");
    XCTAssertEqualObjects(((Pet*)[person.listPets.list objectAtIndex:0]).type , @"Dog");
    XCTAssertEqualObjects(((Pet*)[person.listPets.list objectAtIndex:1]).name , @"b");
    XCTAssertEqualObjects(((Pet*)[person.listPets.list objectAtIndex:1]).type , @"Cat");
}

#pragma mark - NSCopying

- (void)testCopyingPerson {
    Person* clonePerson = [self.person copy];
    XCTAssertEqualObjects(self.person, clonePerson);
    
    clonePerson.name = @"clone";
    XCTAssertNotEqual(self.person.name, clonePerson.name);
    
    ((Pet*)[clonePerson.listPets.list objectAtIndex:0]).name = @"abc";
    XCTAssertNotEqual(((Pet*)[_person.listPets.list objectAtIndex:0]).name, ((Pet*)[clonePerson.listPets.list objectAtIndex:0]).name);
}

#pragma mark - Custom methods
- (void)testHavePetsWithType{
    XCTAssertTrue([_person havePetsWithType:@"Snake"]);
    XCTAssertFalse([_person havePetsWithType:@"Cat"]);
}

@end

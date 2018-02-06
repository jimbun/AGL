//
//  ListPerson.m
//  AGL
//
//  Created by Jim Bun on 4/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import "ListPerson.h"

@implementation ListPerson

#pragma mark - Initializers

- (instancetype)initWithListPeople:(NSArray *)listPeople{
    if(self = [super init]){
        NSMutableArray* list = [[NSMutableArray alloc] initWithCapacity:listPeople.count];
        for (NSDictionary* person in listPeople){
            [list addObject:[[Person alloc] initWithAttributes:person]];
        }
        _list = [[NSArray alloc] initWithArray:list];
    }
    return self;
}

- (NSInteger)count{
    return _list.count;
}

- (BOOL)isEmpty{
    return _list.count <= 0;
}

- (NSArray*)filterListWithPetType:(NSString*)type{
    
    NSMutableArray* selectedList = [[NSMutableArray alloc] init];
    
    for(Person *person in _list){
        if([person havePetsWithType:type]){
            //copy person instance
            Person* copyPerson = [person copy];
            //remove all other pet types from pet list
            copyPerson.listPets.list = [copyPerson.listPets filterListWithType:type];
            //added to selected list
            [selectedList addObject:copyPerson];
        }
    }
    return [[NSArray alloc] initWithArray:selectedList];
}

@end

//
//  Person.m
//  AGL
//
//  Created by Jim Bun on 4/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import "Person.h"


NSString *const AGLSerializeKeyPersonName = @"name";
NSString *const AGLSerializeKeyPersonGender = @"gender";
NSString *const AGLSerializeKeyPersonAge = @"age";
NSString *const AGLSerializeKeyPersonPets = @"pets";

@implementation Person

#pragma mark - NSCopying
- (instancetype)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age listPets:(ListPets *)listPets{
    if(self = [super init]){
        _name = name;
        _gender = gender;
        _age = age;
        _listPets = listPets;
    }
    return self;
}

- (instancetype)initWithAttributes:(NSDictionary *)attributes{
    if(self = [super init]){
        
        if([attributes valueForKey:AGLSerializeKeyPersonName]){
            _name = [attributes valueForKey:AGLSerializeKeyPersonName];
        }
        
        if ([attributes valueForKey:AGLSerializeKeyPersonGender]){
            _gender = [attributes valueForKey:AGLSerializeKeyPersonGender];
        }
        
        if([attributes valueForKey:AGLSerializeKeyPersonAge]){
            _age = (NSUInteger)[[attributes valueForKeyPath:AGLSerializeKeyPersonAge] integerValue];
        }
        
        if([attributes valueForKey:AGLSerializeKeyPersonPets]){
            _listPets = [[ListPets alloc] initWithListPets:(NSArray*)[attributes valueForKey:AGLSerializeKeyPersonPets]];
        }
    }
    return self;
}

- (BOOL)havePetsWithType:(NSString*)type{
    BOOL found = NO;
    for(Pet* pet in _listPets.list){
        if([pet.type isEqualToString:type]){
            found = YES;
            break;
        }
    }
    return found;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return [[Person alloc] initWithName:_name gender:_gender age:_age listPets:[_listPets copy]];
}

- (BOOL)isEqualToPerson:(Person *)person {
//    return [self.UUID isEqual:item.UUID];
    return true;
}


- (BOOL)isEqual:(id)person {
    if ([person isKindOfClass:[Person class]]) {
        return [self isEqualToPerson:person];
    }
    return NO;
}
@end

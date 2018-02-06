//
//  Pet.m
//  AGL
//
//  Created by Jim Bun on 4/2/18.
//  Copyright © 2018 Jim Bun. All rights reserved.
//

#import "ListPets.h"

NSString *const AGLSerializeKeyPetName = @"name";
NSString *const AGLSerializeKeyPetType = @"type";

@implementation Pet

- (instancetype)initWithName:(NSString *)name type:(NSString *)type{
    if(self = [super init]){
        _name = name;
        _type = type;
    }
    return self;
}

- (instancetype)initWithAttributes:(NSDictionary*)attributes{
    if(self = [super init]){
        if([attributes valueForKey:AGLSerializeKeyPetName]){
            _name = [attributes valueForKey:AGLSerializeKeyPetName];
        }
        
        if([attributes valueForKey:AGLSerializeKeyPetType]){
            _type = [attributes valueForKey:AGLSerializeKeyPetType];
        }
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone {
    return [[Pet alloc] initWithName:self.name type:self.type];
}

@end



@implementation ListPets:NSObject

- (instancetype)initWithListPets:(NSArray*)pets{
    if(self = [super init]){
        if(![pets isEqual:[NSNull null]]){
            NSMutableArray* listPets = [[NSMutableArray alloc] initWithCapacity:pets.count];
            for (NSDictionary* petAttributes in pets){
                [listPets addObject:[[Pet alloc] initWithAttributes:petAttributes]];
            }
            _list = [[NSArray alloc] initWithArray:listPets];
        }
    }
    return self;
}

- (instancetype)copyWithZone:(NSZone *)zone{
    return [[ListPets alloc] initWithListPets:self.list];
}

- (NSInteger)count{
    return _list.count;
}

- (BOOL)isEmpty{
    return _list.count <= 0;
}

- (NSArray*)filterListWithType:(NSString*)type{
    NSMutableArray* selectedPets = [[NSMutableArray alloc] init];
    for (Pet *pet in _list){
        if([pet.type isEqualToString:type]){
            [selectedPets addObject:pet];
        }
    }
    return [[NSArray alloc] initWithArray:selectedPets];
}

- (void)sortByNameOrderedAcending:(BOOL)acending{
    _list = [_list sortedArrayUsingComparator:^NSComparisonResult(id pet1, id pet2) {
        return acending ? [((Pet*)pet1).name compare:((Pet*)pet2).name] : [((Pet*)pet2).name compare:((Pet*)pet1).name];
    }];
}

@end

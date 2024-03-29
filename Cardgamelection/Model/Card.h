//
//  Card.h
//  Cardgamelection
//
//  Created by Jonas Lauritsen on 14/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int)match: (NSArray *) otherCards;

@end

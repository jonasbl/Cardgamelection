//
//  CardMatchingGameTwo.h
//  Cardgamelection
//
//  Created by Jonas Lauritsen on 27/03/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGameTwo : NSObject


// designated initializer
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck: (Deck *)deck;

- (void) chooseCardAtIndex: (NSUInteger) index;
- (Card *) cardAtIndex:  (NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end

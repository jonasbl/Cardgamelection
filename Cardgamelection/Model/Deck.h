//
//  Deck.h
//  Cardgamelection
//
//  Created by Jonas Lauritsen on 14/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard: (Card *)card atTop: (BOOL)atTop;
- (void)addCard: (Card *)card;

- (Card *) drawRandomCard;

@end

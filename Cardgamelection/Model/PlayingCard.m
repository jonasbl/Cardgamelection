//
//  PlayingCard.m
//  Cardgamelection
//
//  Created by Jonas Lauritsen on 14/02/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    
    if (otherCards.count == 1)            // comparision of TWO cards
    {
        id otherCard = [otherCards lastObject];
        
        if ([otherCard isKindOfClass:[PlayingCard class]])
        {
            PlayingCard *otherPlayingCard = (PlayingCard *) otherCard;
            
            if ([otherPlayingCard.suit isEqualToString:self.suit]) {
                score = 4;
            } else if (otherPlayingCard.rank == self.rank) {
                score = 1;
            }
        }
        
    } else if (otherCards.count == 2)     // comparision of THREE cards
    {
        id otherCard0 = [otherCards objectAtIndex:0];
        id otherCard1 = [otherCards objectAtIndex:1];
        
        if ([otherCard0 isKindOfClass:[PlayingCard class]]
            && [otherCard0 isKindOfClass:[PlayingCard class]])
        {
            PlayingCard *otherPlayingCard0 = (PlayingCard *) otherCard0;
            PlayingCard *otherPlayingCard1 = (PlayingCard *) otherCard1;
            
            if ([otherPlayingCard0.suit isEqualToString:self.suit]
                && [otherPlayingCard1.suit isEqualToString:self.suit]) {
                score = 10;
                
            } else if ((otherPlayingCard0.rank == self.rank)
                       && (otherPlayingCard1.rank == self.rank)) {
                score = 2;
            }
        }
    }
    
    
    return score;
    
}





- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


@synthesize suit = _suit;

+ (NSArray *) validSuits
{
    return @[@"♥️", @"♠️", @"♦️", @"♣️"];
}


- (void) setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit])
    {
        _suit = suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit: @"?";
}

+ (NSArray *) rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank
{
    return [[self rankStrings] count]-1;
}

- (void) setRank:(NSUInteger) rank
{
    if(rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

@end

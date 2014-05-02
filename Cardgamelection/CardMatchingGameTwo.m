//
//  CardMatchingGameTwo.m
//  Cardgamelection
//
//  Created by Jonas Lauritsen on 27/03/14.
//  Copyright (c) 2014 Jonas Lauritsen. All rights reserved.
//

#import "CardMatchingGameTwo.h"

@interface CardMatchingGameTwo()

@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards; // of cards

@end

@implementation CardMatchingGameTwo



- (NSMutableArray *) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init]; // super's designated initializer
    
    if (self)
    {
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (card)
            {
                [self.cards addObject:card];
            }
            else
            {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index
{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

-(void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index],
    *otherCard1  = nil,
    *otherCard2  = nil;
    
    int localscore = 0;
    
    
    
    if (!card.isMatched)
    {
        for (Card *otherCard in self.cards)
        {
            if (!otherCard.isMatched && otherCard.isChosen)
            {
                if (! otherCard1)
                {
                    otherCard1 = otherCard;
                }
                else if (! otherCard2)
                {
                    otherCard2 = otherCard;
                }
                else
                {
                    break;
                }
            }
        }
        
        if (otherCard1 && otherCard2)
        {
            int matchScore = [card match:@[ otherCard1, otherCard2 ]];
            
            if (matchScore)
            {
                otherCard1.matched  = YES;
                otherCard2.matched  = YES;
                card.matched        = YES;
                
                localscore             = matchScore * MATCH_BONUS;
                self.score            += localscore;
                
            }
            else
            {
                otherCard1.chosen  = NO;
                otherCard2.chosen  = NO;
                
                localscore         = MISMATCH_PENALTY;
                self.score        -= localscore;
                
            }
        }
        
        
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
}


@end

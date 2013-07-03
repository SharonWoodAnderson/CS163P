//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Kyle Adams on 6/14/13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSMutableArray *facedUpCards;
@property (nonatomic) int score;
@property (nonatomic) NSString *flipDescription;
@end

@implementation CardMatchingGame


//Lazy instantiation
-(NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(NSMutableArray *)facedUpCards
{
    if (!_facedUpCards) {
        _facedUpCards = [[NSMutableArray alloc] init];
    }
    return _facedUpCards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck matchingCards:(NSUInteger)gameTypeCards
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    _numberOfMatchingCards = gameTypeCards;
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MATCH_BONUS 4 
#define MISMATCH_PENALTY 2

-(void) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.isUnplayable) {
        if (!card.isFaceUp) {
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];
            NSMutableArray *otherContents = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    [otherCards addObject:otherCard];
                    [otherContents addObject:otherCard.contents];
                }
            }
            if ([otherCards count] < _numberOfMatchingCards - 1) {
                self.flipDescription = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            } else {
                int matchScore = [card match:otherCards];
                if (matchScore) {
                    card.unplayable = YES;
                    for (Card *otherCard in otherCards) {
                        otherCard.unplayable = YES;
                        
                    }
                    self.score += matchScore * MATCH_BONUS;
                    self.flipDescription =
                    [NSString stringWithFormat:@"Matched %@ & %@ for %d points",
                     card.contents,
                     [otherContents componentsJoinedByString:@" & "],
                     matchScore * MATCH_BONUS];
                } else {
                    for (Card *otherCard in otherCards) {
                        otherCard.faceUp = NO;
                    }
                    self.score -= MISMATCH_PENALTY;
                    self.flipDescription =
                    [NSString stringWithFormat:@"%@ & %@ don’t match! %d point penalty!",
                     card.contents,
                     [otherContents componentsJoinedByString:@" & "],
                     MISMATCH_PENALTY];
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.faceUp;
    }
}

@end

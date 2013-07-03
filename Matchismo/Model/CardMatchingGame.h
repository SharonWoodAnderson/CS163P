//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Kyle Adams on 6/14/13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck matchingCards:(NSUInteger)gameTypeCards;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)int score;

@property (nonatomic, readonly) NSString *flipDescription;

@property (nonatomic) int numberOfMatchingCards;

@end

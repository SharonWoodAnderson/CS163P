//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Kyle Adams on 6/12/13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@end

@implementation CardGameViewController

@synthesize game = _game;

-(CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

@end

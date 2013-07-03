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

@synthesize game = _game, gameResult = _gameResult;

-(CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init] matchingCards:2];
    }
    return _game;
}

- (GameResults *)gameResult
{
    if (!_gameResult) _gameResult = [[GameResults alloc] init];
    _gameResult.gameType = @"Card Matching";
    return _gameResult;
}

- (void)updateUI
{
    UIImage *cardBackImage = [UIImage imageNamed:@"card-back.png"];
    UIImage *blank = [[UIImage alloc] init];
    
    for (UIButton *cardButton in self.cardButtons)
    {
        [cardButton setImage:cardBackImage forState:UIControlStateNormal];
        [cardButton setImage:blank forState:UIControlStateSelected];
        [cardButton setImage:blank forState:UIControlStateSelected|UIControlStateDisabled];
    }
    [super updateUI];
    
}



@end

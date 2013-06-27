//
//  SetCard.m
//  Matchismo
//
//  Created by Kyle Adams on 19-06-13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import "SetCard.h"

#define NUMBER_OF_MATCHING_CARDS 3

@implementation SetCard

@synthesize color = _color, symbol = _symbol, shading = _shading;

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == NUMBER_OF_MATCHING_CARDS - 1) {
        NSMutableArray *colors = [[NSMutableArray alloc] init];
        NSMutableArray *symbols = [[NSMutableArray alloc] init];
        NSMutableArray *shadings = [[NSMutableArray alloc] init];
        NSMutableArray *numbers = [[NSMutableArray alloc] init];
        [colors addObject:self.color];
        [symbols addObject:self.symbol];
        [shadings addObject:self.shading];
        [numbers addObject:@(self.number)];
        for (id otherCard in otherCards) {
            if ([otherCard isKindOfClass:[SetCard class]]) {
                SetCard *otherSetCard = (SetCard *)otherCard;
                if (![colors containsObject:otherSetCard.color])
                    [colors addObject:otherSetCard.color];
                if (![symbols containsObject:otherSetCard.symbol])
                    [symbols addObject:otherSetCard.symbol];
                if (![shadings containsObject:otherSetCard.shading])
                    [shadings addObject:otherSetCard.shading];
                if (![numbers containsObject:@(otherSetCard.number)])
                    [numbers addObject:@(otherSetCard.number)];
                if (([colors count] == 1 || [colors count] == NUMBER_OF_MATCHING_CARDS)
                    && ([symbols count] == 1 || [symbols count] == NUMBER_OF_MATCHING_CARDS)
                    && ([shadings count] == 1 || [shadings count] == NUMBER_OF_MATCHING_CARDS)
                    && ([numbers count] == 1 || [numbers count] == NUMBER_OF_MATCHING_CARDS)) {
                    score = 4;
                }
            }
        }
    }
    
    return score;
}

- (NSString *)contents
{
    return [NSString stringWithFormat:@"%d:%@:%@:%@", self.number, self.color, self.symbol, self.shading];
}

- (void)setColor:(NSString *)color
{
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

- (NSString *)color
{
    return _color ? _color : @"?";
}

- (void)setSymbol:(NSString *)symbol
{
    if ([[SetCard validSymbols] containsObject:symbol]) {
        _symbol = symbol;
    }
}

- (NSString *)symbol
{
    return _symbol ? _symbol : @"?";
}

- (void)setShading:(NSString *)shading
{
    if ([[SetCard validShading] containsObject:shading]) {
        _shading = shading;
    }
}

- (void)setNumber:(NSUInteger)number
{
    if (number <= [SetCard maxNumberInSet]) {
        _number = number;
    }
}

- (NSString *)shading
{
    return _shading ? _shading : @"?";
}

+ (NSArray *)validColors
{
    return @[@"blue",@"red",@"green"];
}

+ (NSArray *)validSymbols
{
    return @[@"square", @"triangle", @"circle"];
}

+ (NSArray *)validShading
{
    return @[@"full",@"half",@"empty"];
}

+ (NSUInteger)maxNumberInSet
{
    return 3;
}

@end

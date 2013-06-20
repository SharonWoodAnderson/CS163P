//
//  SetCard.m
//  Matchismo
//
//  Created by Kyle Adams on 19-06-13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

@synthesize color = _color, symbol = _symbol, shading = _shading;

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

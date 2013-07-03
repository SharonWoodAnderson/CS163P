//
//  GameResults.h
//  Matchismo
//
//  Created by Kyle Adams on 01-07-13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResults : NSObject

+ (NSArray *)allGameResults; //of GameResults

@property (readonly, nonatomic) NSDate *start;
@property (readonly, nonatomic) NSDate *end;
@property (readonly, nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

@property (strong, nonatomic) NSString *gameType;

- (NSComparisonResult)compareScoreToGameResult:(GameResults *)otherResult;
- (NSComparisonResult)compareEndDateToGameResult:(GameResults *)otherResult;
- (NSComparisonResult)compareDurationToGameResult:(GameResults *)otherResult;
+ (void)resetScoresInDefaultMemory;

@end

//
//  GameViewController.h
//  Matchismo
//
//  Created by Kyle Adams on 19-06-13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface GameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreButton;
@property (weak, nonatomic) IBOutlet UILabel *lastFlipLabel;
@property (strong, nonatomic) CardMatchingGame *game;

-(void)updateUI;

@end

//
//  GameViewController.m
//  Matchismo
//
//  Created by Kyle Adams on 19-06-13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    UIImage *cardBackImage = [UIImage imageNamed:@"card-back.png"];
    UIImage *blank = [[UIImage alloc] init];
    
    for (UIButton *cardButton in cardButtons)
    {
        [cardButton setImage:cardBackImage forState:UIControlStateNormal];
        [cardButton setImage:blank forState:UIControlStateSelected];
        [cardButton setImage:blank forState:UIControlStateSelected|UIControlStateDisabled];
    }
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        
    }
    self.scoreButton.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.lastFlipLabel.text = self.game.flipDescription;
}


- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flips updated to %d", self.flipCount);
}

- (IBAction)flipCard:(UIButton *)sender {
    
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
    self.flipCount++;
}


- (IBAction)resetGame:(UIButton *)sender {
    self.game = nil;
    self.flipCount = 0;
    [self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];
}

- (void)setup
{
    //anything i want to initialize
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

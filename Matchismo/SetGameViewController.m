//
//  SetGameViewController.m
//  Matchismo
//
//  Created by Kyle Adams on 19-06-13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "CardMatchingGame.h"

@interface SetGameViewController ()

@end

@implementation SetGameViewController

@synthesize game = _game;

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[SetCardDeck alloc] init] matchingCards:3];
    }
    return _game;
}

-(void)updateUI
{
    {
        for(UIButton *cardButton in self.cardButtons){
            Card *card=[self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
            if(card.isFaceUp)
                cardButton.backgroundColor=[UIColor grayColor];
            else
                cardButton.backgroundColor=nil;
            
            [cardButton setAttributedTitle:[self getCardAttributedContents:(SetCard*)card] forState:UIControlStateNormal];
            cardButton.selected = card.isFaceUp;
            cardButton.enabled =!card.isUnplayable;
            cardButton.alpha =card.isUnplayable? 0.3:1.0;
            [cardButton setImageEdgeInsets:UIEdgeInsetsMake(1,-1,-1,-1)];
        }
        [super updateUI];
        
    }
}

- (NSMutableAttributedString *)getCardAttributedContents:(Card *)card
{
    NSUInteger number = [[card.contents substringFromIndex:0] intValue];
    
    UIColor *color;
    double strokeValue = 0;
    NSString *symbol = @"";
    //set collor
    if ([card.contents rangeOfString:@"blue"].location != NSNotFound) {
        color = [UIColor blueColor];
    }
    if ([card.contents rangeOfString:@"green"].location != NSNotFound) {
        color = [UIColor greenColor];
    }
    if ([card.contents rangeOfString:@"red"].location != NSNotFound) {
        color = [UIColor redColor];
    }
    
    if ([card.contents rangeOfString:@"half"].location != NSNotFound) {
        color = [color colorWithAlphaComponent:0.3];
    }
    
    //set transparency
    if ([card.contents rangeOfString:@"full"].location != NSNotFound) {
        strokeValue = -5;
    }
    if ([card.contents rangeOfString:@"half"].location != NSNotFound) {
        strokeValue = -5;
    }
    if ([card.contents rangeOfString:@"empty"].location != NSNotFound) {
        strokeValue = 5;
    }
    
    if ([card.contents rangeOfString:@"square"].location != NSNotFound) {
        symbol = @"■";
    }
    if ([card.contents rangeOfString:@"triangle"].location != NSNotFound) {
        symbol = @"▲";
    }
    if ([card.contents rangeOfString:@"circle"].location != NSNotFound) {
        symbol = @"●";
    }
    
    NSString *matstring = [[NSString alloc] init];
    
    for (int i = 1; i <= number; i++) {
        matstring = [matstring stringByAppendingFormat:@"%@", symbol];
    }
    
    NSMutableAttributedString *mat = [[NSMutableAttributedString alloc] initWithString:matstring];
    NSRange range = [[mat string] rangeOfString:matstring];
    
    [mat addAttributes:@{NSStrokeWidthAttributeName:@(strokeValue),NSStrokeColorAttributeName:color,NSForegroundColorAttributeName:color } range: range];
    
    
    
    
    NSLog(@"Set card to: %@",matstring);
    NSLog(@"Card contents: %@", card.contents);
    
    return mat;
}


- (void)setup
{
    //anything
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

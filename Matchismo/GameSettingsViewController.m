//
//  GameSettingsViewController.m
//  Matchismo
//
//  Created by Kyle Adams on 01-07-13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import "GameSettingsViewController.h"
#import "GameResults.h"

@interface GameSettingsViewController ()

@end

@implementation GameSettingsViewController

@synthesize gameResult = _gameResult;

- (IBAction)resetScores:(UIButton *)sender {
    [GameResults resetScoresInDefaultMemory];
}

- (void)setup
{
    //anything after ViewDidLoad
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

//
//  GameResultsViewController.m
//  Matchismo
//
//  Created by Kyle Adams on 20-06-13.
//  Copyright (c) 2013 Kyle Adams. All rights reserved.
//

#import "GameResultsViewController.h"

@interface GameResultsViewController ()

@end

@implementation GameResultsViewController

-(void)updateUI
{
    self.scoresField.text = [self.scoresField.text stringByAppendingString:self.scores];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

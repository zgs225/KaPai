//
//  KaPaiViewController.m
//  KaPai
//
//  Created by Yuez on 14-7-12.
//  Copyright (c) 2014年 XGTEAM. All rights reserved.
//

#import "KaPaiViewController.h"
#import "PlayingCardDeck.h"

@interface KaPaiViewController ()

@property (nonatomic, strong) Deck *deck;

@end

@implementation KaPaiViewController

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchCardButton:(id)sender
{
    if ([[sender currentTitle] length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        Card *card = [self.deck drawRandomCard];
        [sender setBackgroundImage:[UIImage imageNamed:@"blankcard"]
                          forState:UIControlStateNormal];
        [sender setTitle:card.content forState:UIControlStateNormal];
    }
}

@end

//
//  KaPaiViewController.m
//  KaPai
//
//  Created by Yuez on 14-7-12.
//  Copyright (c) 2014年 XGTEAM. All rights reserved.
//

#import "KaPaiViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface KaPaiViewController ()

@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation KaPaiViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self creataDeck]];
    }
    return _game;
}

- (Deck *)creataDeck
{
    return [[PlayingCardDeck alloc] init];
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
    NSUInteger chosenIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenIndex];
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        [cardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"blankcard" : @"cardback"];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.content : @"";
}

@end

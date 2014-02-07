//
//  MatchismoViewController.m
//  Matchismo
//
//  Created by Petri Partanen on 28/01/14.
//  Copyright (c) 2014 Petri Partanen. All rights reserved.
//

#import "MatchismoViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface MatchismoViewController ()

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSwitch;

@end

@implementation MatchismoViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    
    return _game;
}

- (PlayingCardDeck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSInteger buttonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:buttonIndex];

    self.gameModeSwitch.enabled = NO;
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *button in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
        
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        button.enabled = !card.isMatched;
        [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", self.game.score]];
    }
    
    if (self.gameModeSwitch.isEnabled) {
        [self.gameModeSwitch setSelectedSegmentIndex:self.game.matchCardCount - 2];
    }
}

- (IBAction)resetGame
{
    self.game = Nil;
    self.game.matchCardCount = 2;
    self.gameModeSwitch.enabled = YES;
    [self updateUI];
}

- (IBAction)switchGameMode:(UISegmentedControl *)sender
{
    self.game.matchCardCount = 2 + sender.selectedSegmentIndex;
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return card.isChosen ? [UIImage imageNamed:@"Cardfront"] : [UIImage imageNamed:@"Cardback"];
}

@end

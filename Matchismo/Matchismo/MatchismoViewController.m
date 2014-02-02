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

@property (nonatomic) NSInteger numberOfClicks;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) Deck *deck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

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

- (Deck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc]init];
    }
    
    return _deck;
}

- (void)setNumberOfClicks:(int)numberOfClicks
{
    _numberOfClicks = numberOfClicks;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.numberOfClicks];
    
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSInteger buttonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:buttonIndex];
    [self updateUI];
    
}

- (void)updateUI
{
    for (UIButton *button in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
        
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
    }
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

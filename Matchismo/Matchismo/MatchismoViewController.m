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

@interface MatchismoViewController ()

@property (nonatomic) int numberOfClicks;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) Deck *deck;

@end

@implementation MatchismoViewController

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
    if (self.numberOfClicks % 2 == 0) {
        [sender setBackgroundImage:[UIImage imageNamed:@"Cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:[self.deck drawRandomCard].contents forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"Cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }

    self.numberOfClicks++;
}

@end

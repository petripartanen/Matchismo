//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Petri Partanen on 02/02/14.
//  Copyright (c) 2014 Petri Partanen. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (readwrite, nonatomic) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    if (count < 2) {
        // We need at least two cards to play card matching game
        return Nil;
    }
    
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            
            if (card) {
                [self.cards addObject:card];
            } else {
                // Deck didn't have enough cards; initialization failed
                self = Nil;
                break;
            }
            
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : Nil;
}

@end

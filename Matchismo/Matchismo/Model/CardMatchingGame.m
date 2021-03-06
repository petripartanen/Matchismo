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
    
    self.matchCardCount = 2;
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : Nil;
}

static const int MISMATCH_PENALTY = 2;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            card.chosen = YES;
            
            NSMutableArray *chosenCards = [[NSMutableArray alloc]init];
            
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
                }
            }
            
            if ([chosenCards count] == self.matchCardCount) {
                NSInteger matchScore = [self calculateMatch:[chosenCards mutableCopy]];
                
                if (matchScore) {
                    self.score += matchScore;
                    
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.matched = YES;
                    }
                    card.matched = YES;
                } else {
                    self.score -= MISMATCH_PENALTY;
                    
                    for (Card *chosenCard in chosenCards) {
                        chosenCard.chosen = NO;
                    }
                }
            }
            
            self.score -= COST_TO_CHOOSE;
        }
    }
}

- (NSInteger)calculateMatch:(NSMutableArray *)cards
{
    if ([cards count] < 2) {
        return 0;
    }
    
    Card *card = [cards firstObject];
    [cards removeObject:card];
    
    return [card match:cards] + [self calculateMatch:cards];
}

@end

//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Petri Partanen on 02/02/14.
//  Copyright (c) 2014 Petri Partanen. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *playingCard = [[PlayingCard alloc]init];
                playingCard.rank = rank;
                playingCard.suit = suit;
                [self addCard:playingCard];
            }
        }
    }
    
    return self;
}

@end

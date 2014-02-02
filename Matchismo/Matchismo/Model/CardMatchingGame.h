//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Petri Partanen on 02/02/14.
//  Copyright (c) 2014 Petri Partanen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;
- (Card *)cardAtIndex:(NSUInteger)index;
- (void)chooseCardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) NSInteger score;

@end

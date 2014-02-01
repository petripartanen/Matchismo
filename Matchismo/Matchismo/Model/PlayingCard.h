//
//  PlayingCard.h
//  Matchismo
//
//  Created by Petri Partanen on 01/02/14.
//  Copyright (c) 2014 Petri Partanen. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suite;
@property (nonatomic) NSUInteger rank;

@end

//
//  PlayingCard.m
//  Matchismo
//
//  Created by Petri Partanen on 01/02/14.
//  Copyright (c) 2014 Petri Partanen. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    return [NSString stringWithFormat:@"%d%@", self.rank, self.suite];
}

@end

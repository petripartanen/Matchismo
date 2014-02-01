//
//  PlayingCard.m
//  Matchismo
//
//  Created by Petri Partanen on 01/02/14.
//  Copyright (c) 2014 Petri Partanen. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suite = _suite;

- (NSString *)contents
{
    NSArray *rankStrings = @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    return [rankStrings[self.rank] stringByAppendingString:self.suite];
}

- (void)setSuite:(NSString *)suite
{
    NSArray *validSuites = @[@"♥",@"♦",@"♠",@"♣"];
    
    if ([validSuites containsObject:suite]) {
        _suite = suite;
    }
}

- (NSString *)suite
{
    return _suite ? _suite : @"?";
}

@end

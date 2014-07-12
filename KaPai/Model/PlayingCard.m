//
//  PlayingCard.m
//  KaPai
//
//  Created by Yuez on 14-7-13.
//  Copyright (c) 2014年 XGTEAM. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSutes] containsObject:suit])
        _suit = suit;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
        _rank = rank;
}

- (NSString *)content
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray *)validSutes
{
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

@end

//
//  Card.m
//  KaPai
//
//  Created by Yuez on 14-7-13.
//  Copyright (c) 2014年 XGTEAM. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *card in otherCards)
        if([card.content isEqualToString:self.content])
            score = 1;
    return score;
}

@end

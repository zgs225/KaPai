//
//  CardMatchingGame.h
//  KaPai
//
//  Created by Yuez on 14-7-13.
//  Copyright (c) 2014年 XGTEAM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// Designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end

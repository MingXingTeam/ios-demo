//
//  Deck.h
//  Matchismo
//
//  Created by maomao on 15/3/15.
//  Copyright (c) 2015年 ths. All rights reserved.
//
/*
 
 卡片堆
 
 */
#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

//添加牌
//以下是两个完全不同的方法
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

//从牌堆中取牌
- (Card *)drawRandomCard;
@end

//
//  PlayingCard.h
//  Matchismo
//
//  Created by maomao on 15/3/15.
//  Copyright (c) 2015年 ths. All rights reserved.
//公共API
/*
 
 牌
 
 */

#import <Foundation/Foundation.h>
#import "Card.h"


@interface PlayingCard : Card

//花色
@property (strong,nonatomic) NSString *suit;

//大小
@property (nonatomic) NSUInteger rank;

//有效牌有哪些
+ (NSArray *)validSuits;

//牌的张数
+ (NSUInteger)maxRank;

@end

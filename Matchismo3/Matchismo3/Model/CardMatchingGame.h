//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by maomao on 15/3/14.
//  Copyright (c) 2015年 ths. All rights reserved.
//
/*
 
 卡片匹配游戏
 
 */


//设计一个新类时 首先考虑公共API 也就是其他人会怎么用你的类
//如果是复杂的类 应该和团队其他成员讨论 如何设计这个类 如何以世界对象的角度考虑问题
#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//实例初始化函数
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

//根据索引选择牌 NSUInteger不可以为负数
- (void)chooseCardAtIndex:(NSUInteger)index;
//根据索引返回牌：当前牌的状态
- (Card *)cardAtIndex:(NSInteger) index;

//分数 readyonly是因为分数只能内部设置 外部不能更改
@property (nonatomic,readonly) NSInteger score;

@end

//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by maomao on 15/3/15.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

//调用alloc以后一定要初始化。不初始化就分配对象在堆中毫无意义。
//没有调用alloc就不要调用init。而且不要多次调用init。
@implementation PlayingCardDeck

//重写Object对象的init方法
//这里不能返回PlayingCardDeck * 因为NSObject对象已经返回NSObject *
//instancetype 是ios7的属性
- (instancetype)init{
    //这个代码意思是父类无法被初始化返回nil 子类也不能初始化
    self = [super init];
    
    if(self){
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank=1;rank <= [PlayingCard maxRank];rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    
    //返回自己有一个好处就是：链式调用
    return self;
}

@end

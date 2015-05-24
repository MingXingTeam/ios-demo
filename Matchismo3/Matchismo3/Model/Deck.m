//
//  Deck.m
//  Matchismo
//
//  Created by maomao on 15/3/15.
//  Copyright (c) 2015年 ths. All rights reserved.
//

//使Deck类通用，不仅可以是牌 还可以是其他的东西，比如语法卡片

#import "Deck.h"

@interface Deck()

//保存所有的牌
//nonatomic总是要加的
//strong只能用于指针
//cards刚初始化的时候不指向任何东西
@property (strong,nonatomic)NSMutableArray *cards;//of Card

@end

@implementation Deck

//实现getter方法
- (NSMutableArray *)cards{
    //首先判断cards是否初始化了，如果没有就给分配空间
    //这种方式称为：惰性实例化  在最接近要使用的地方实例化
    //_cards是默认的实例变量 xcode会自动生成。
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card  atIndex:0];
    }else{
        [self.cards addObject:card];
    }
}
- (void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard{
    Card *randomCard = nil;
    
    if([self.cards count]){
        //arc4random是c语言库里面的一个随机函数 随机返回一个整数
        //为什么不用NSInteger或者NSUInteger或者NSNumber，一般用以上方式是为了发送消息（调用这些对象的方法），而这里仅仅是一个局部变量 不需要这么做
        unsigned index = arc4random() % [self.cards count];
        //self.cards[index]是访问数组的标准方法。本质上也是发送一个消息：self.cards objectAtIndex:index
        //如果cards为空，以下语句会报数组越界错误。因为数组为空，无法访问
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}

@end

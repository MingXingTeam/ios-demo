//
//  PlayingCard.m
//  Matchismo
//
//  Created by maomao on 15/3/15.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

//重写Card类的match方法。可以在PlayingCard.h中声明这个方法也可以不声明。
- (int)match:(NSArray *)otherCards{
    int score = 0;
    //只匹配一张牌
    if ([otherCards count]==1) {
        id card = [otherCards firstObject];
        //增加运行时检验 防止当firstObject返回的对象不是PlayingCard时程序崩溃
        if([card isKindOfClass:[PlayingCard class]]){
            //firstObject方法和otherCards[0]的区别是 前者当数组为空时返回nil 而后者会导致程序崩溃
            PlayingCard *otherCard = (PlayingCard *)card;
            if([self.suit isEqualToString:otherCard.suit]){
                score = 1;
            }else if(self.rank == otherCard.rank){
                score = 4;
            }
        }
    }
    
    return score;
}

//重写父类的content方法
//在一个字符串前面加一个@ 那么编译器会为你创建一个字符串对象
//@的作用是创建一个对象
//如下方法中是创建一个数组 [[NSArray alloc] init]
- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

//类方法
//什么时候用类方法？
//当实现一些工具方法时 工具方法不会访问任何实例变量
//用于创建对象（事物）
//该方法是公有的 这样其他就知道哪些是有效的花色了
+ (NSArray *)validSuits{
    //每次都要创建新数组
    return @[@"♥︎",@"♦︎",@"♠︎",@"♣︎"];
}

@synthesize suit = _suit;//重写了getter和setter方法 必须写上这个 否则不需要写

//重写getter方法
//如果setter方法被改名了， 这里就要用新的名字
- (NSString *)suit{
    //确保和rank一样 初始化时返回?
    return _suit ? _suit : @"?";
}

//重写setter方法
//防止其他人调用setter方法设置其他值
- (void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        //    if([@[@"♥︎",@"♦︎",@"♠︎",@"♣︎"] containsObject:suit]){
        _suit = suit;
    }
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"3",@"9",@"10",@"J",@"Q",@"K"];
}

//牌最大是多少
+ (NSUInteger)maxRank{
    return [[self rankStrings] count] - 1;
}

//重写setter方法
- (void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

@end

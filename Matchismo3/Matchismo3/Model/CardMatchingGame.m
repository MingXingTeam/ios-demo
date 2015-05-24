//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by maomao on 15/3/14.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import "CardMatchingGame.h"

//这里可以定义接口.h没定义的属性
@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;//strong一般是默认的 但是习惯要写出来  readwrite也是默认的 一般不写出来
@property (nonatomic,strong) NSMutableArray *cards;// of Card

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if(!_cards) _cards  = [[NSMutableArray alloc] init];
    return _cards;
}

//实例初始化函数
- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    
    if(self){
        for(int i=0;i<count;i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

//#define MISMATCH_PENALTY 2
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

//根据索引选择牌 NSUInteger不可以为负数
- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else{
            //匹配其他牌
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];//@[otherCard]是创建数组
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

//根据索引返回牌：当前牌的状态
- (Card *)cardAtIndex:(NSInteger) index{
    return (index < [self.cards count] ? self.cards[index] : nil);
}

//最初的init返回nil
- (instancetype) init{
    return nil;
}




@end

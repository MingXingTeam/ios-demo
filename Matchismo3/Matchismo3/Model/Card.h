//
//  Card.h
//  Matchismo
//
//  Created by maomao on 15/3/14.
//  Copyright (c) 2015年 ths. All rights reserved.
//
/*
 
 卡片
 
 */
#import <Foundation/Foundation.h>//不是导入头文件 而是导入整个框架的所有公共类。IOS7里的语法是@import Foundation

@interface Card : NSObject

//表示纸牌的内容 @property表示是公有的
@property (strong,nonatomic) NSString *contents;

//C语言中没有BOOL 但是OC中有 BOOL本质上是用typeof 类型定义实现的

//原始类型不需要strong、weak修饰 因为它们没有存储在堆中
//getter=somename 给getter方法重命名
//纸牌是否被选中
@property (nonatomic,getter=isChosen) BOOL chosen;

//指派是否匹配
@property (nonatomic,getter=isMatched) BOOL matched;

//判断是否和另外一张牌匹配
- (int)match:(NSArray *)otherCards;
@end

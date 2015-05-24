//
//  Card.m
//  Matchismo
//
//  Created by maomao on 15/3/14.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import "Card.h"//导入公共API

//私有声明：声明私有属性（主要用于声明属性，因为属性会自动生成get和set方法）和方法
//oc里面的函数不需要使用前先声明
@interface Card()
@end

@implementation Card

//synthesize 合成的意思
//_contents是实例变量的名字，属性contents保存在_contents里面
//其实也可以这么写@synthesize contents = somename
@synthesize contents = _contents;
@synthesize chosen = _chosen;
@synthesize matched = _matched;

/*
 @synthesize contents = _contents;
 
 等价于
 
 //返回指向字符串的指针
 - (NSString *) contents{
 return _contents;
 }
 
 - (void) setContents:(NSString *) contents{
 _contents = contents;
 }
 
 
 
 */

//消息接受者是调用函数的对象
//参数是数组，什么类型没有指明？

- (int)match:(NSArray *)otherCards{
    int score = 0;
    for(Card *card in otherCards){
        //不能写card.contents == self.contents 因为这样比较是比较指针
        //getter和setter方法一般用点语法
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}



@end

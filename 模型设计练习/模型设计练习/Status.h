//
//  Status.h
//  模型设计练习
//
//  Created by maomao on 15/1/19.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <Foundation/Foundation.h>
//引入用户
#import "User.h"

@interface Status : NSObject

//微博内容
@property (nonatomic,strong) NSString *text;

//微博配图
@property (nonatomic,strong) NSString *icon;

//发送时间
@property (nonatomic) time_t time;//time_t是本质上是long类型

//微博发送人
@property (nonatomic,strong) User *user;

//转发的微博
@property (nonatomic,strong) Status *retweetStatus;

//被评论数
@property (nonatomic,assign) int commentsCount;

//被转发数
@property (nonatomic,assign) int retweetsCount;

@end

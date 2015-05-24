//
//  User.h
//  模型设计练习
//
//  Created by maomao on 15/1/19.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    SexMan,//男
    SexWoman//女
}Sex;

typedef struct {
    int year;
    int monty;
    int day;
}Date;


@interface User : NSObject

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *account;

@property (nonatomic,strong) NSString *password;

@property (nonatomic,strong) NSString *icon;

//不是对象，用assign
@property (nonatomic,assign) Sex sex;

@property (nonatomic,strong) NSString *phone;

@property (nonatomic,assign) Date birthday;

@end

//
//  Person.h
//  Protocol协议
//
//  Created by maomao on 15/1/20.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <Foundation/Foundation.h>
//引入协议
//#import "MyProtocol2.h"
//建议用声明，在使用到协议的时候再import
@protocol MyProtocol2;

//只要类遵守了某一协议，就能拥有这份协议的所有方法声明
@interface Person : NSObject <MyProtocol2>



@end

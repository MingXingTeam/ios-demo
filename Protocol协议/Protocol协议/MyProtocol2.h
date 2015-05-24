//
//  MyProtocol2.h
//  Protocol协议
//
//  Created by maomao on 15/1/20.
//  Copyright (c) 2015年 ths. All rights reserved.
//


#import <Foundation/Foundation.h>
//引入协议
#import "MyProtocol.h"

@protocol MyProtocol2 <MyProtocol>

@required
- (void) test3;

@end

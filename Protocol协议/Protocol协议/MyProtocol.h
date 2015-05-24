//
//  MyProtocol.h
//  Protocol协议
//
//  Created by maomao on 15/1/20.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <Foundation/Foundation.h>

//定义了一个名叫MyProtocol的协议（NSObject是基协议，NSObject遵守基协议，所有类继承NSObject，所以有release、description等方法）

@protocol MyProtocol <NSObject>

//@required 必须实现 不实现会发出警告（不写的默认项）

@required
- (void) test;

//@optional 可选
@optional
- (void) test2;


@end

//
//  main.m
//  Protocol协议
//
//  Created by maomao on 15/1/20.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MyProtocol.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    //正确
    NSObject *obj = [[Person alloc] init];
    obj = nil;
    //警告！
    NSObject<MyProtocol> *obj2 = [[NSObject alloc] init];
    obj2 = nil;
    //正确
    NSObject<MyProtocol> *obj3 = [[Person alloc] init];
    obj3 = nil;
    
    
    
    return 0;
}

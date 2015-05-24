//
//  main.m
//  Block数据结构
//
//  Created by maomao on 15/1/20.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int (^MyBlock)(int,int);

typedef void (^VoidBlock)();

int main(int argc, const char * argv[]) {
    __block int a = 12;
    
    void (^myblock)()=^{
        NSLog(@"-------------");
        NSLog(@"-------------");
    };
    
    myblock();
    
    
    int (^myblock2)(int,int) = ^(int a,int b){
        return a+b;
    };
    
    NSLog(@"%d",myblock2(2,34));
    
    void (^myblock3)() = ^{
        a = 14;
        NSLog(@"%d",a);
    };
    
    myblock3();
    
    MyBlock myblock4 = ^(int a,int b){
        NSLog(@"用typedef简化");
        return a+b;
    };
    myblock4(12,22);
    
    VoidBlock myblock5 = ^{
        NSLog(@"void block");
    };
    
    myblock5();
    
    return 0;
}

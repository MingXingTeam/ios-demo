//
//  main.m
//  NSArray
//
//  Created by maomao on 15/1/25.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
    
    int a = 5;
    
    int ages[10] = {1,90,89,18};
    
    Person *p = [[Person alloc] init];
    
    Person *person[5] = {p, [[Person alloc] init]};
    
    //oc数组不能存放nil值
    //oc数组只能存放OC对象，不能存放非OC对象类型，比如int,struct,enum等
    
    //这个array永远是空数组
    //NSArray *arr = NSArray array]
    
    //@
    //
    NSArray *ar =@[@"java",@"asdf"];
    
    NSLog(@"%ld",[ar count]);
    
    //遍历数组
    for(int i = 0;i<[ar count];i++){
        NSLog(@"%@",ar[i]);
    }
    
    for(id obj in ar){
        NSUInteger i = [ar indexOfObject:obj];
        
        NSLog(@"%ld -- %@",i,obj);
    }
    
    //每遍历到一个元素，就会调用一次block,并且当前元素和索引位置当做参数传给block
    [ar enumerateObjectsUsingBlock:^(id obj,NSUInteger idx,BOOL *stop){
        if(idx == 1){
            //停止遍历
            *stop = YES;
        }
    }];
    
    
    
    return 0;
}

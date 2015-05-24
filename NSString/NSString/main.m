//
//  main.m
//  NSString
//
//  Created by maomao on 15/1/24.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    
//    
//    NSMutableString *s1 = [NSMutableString stringWithFormat:(NSString *), ...]
    

    
    
    return 0;
}


void test(){
    //通过类方法创建字符串 类方法一般都是以类名开头
    //    NSString stringWithFormat:<#(NSString *), ...#>
    //    NSNumber numberWithInt:<#(int)#>
    
    
    //字符串的导出
    //    [@"mao" writeToFile:@"/Users/apple/Desktop/my.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString *str = @"234";
    NSURL *url = [NSURL fileURLWithPath:@"/Users/apple/Desktop/my2.txt"];
    //    str writeToURL:<#(NSURL *)#> atomically:<#(BOOL)#> encoding:<#(NSStringEncoding)#> error:<#(NSError *__autoreleasing *)#>
    
    
}
//
//  main.m
//  结构体
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
    
    //NSRange
    //NSPoint
    //NSSize
    //NSRect
    
    struct Date{
        int year;
        int month;
        int day;
    };
    
//    struct Date d = {2011,12,1};
//    
//    struct Date d2 = {.month = 10,.year = 2012, .day = 12};
//    
    
    // @"i love oc"//love的范围
    
    NSRange r1 = {2,4};//不用这个
    NSRange r2 = {.location = 2, .length = 4};//不用这个
    NSRange r3 = NSMakeRange(2,4);//掌握
    
    NSString *str = @"i love oc";
//    NSRange range = [str rangeOfString:]
    //range.location  range.length
    //找不到：location=NSNotFound（-1） length=0
    

    //CGPoint p1 = NSMakePoint(10,10);
    //NSPoint p2 = CGPointMake(20,20);//最常用
    
    //宽、高
    NSSize s1 = CGSizeMake(100,20);
    
    //
    NSSize s2 = NSMakeSize(100,30);
    
    //
    CGSize s3 = NSMakeSize(100,30);
    //矩形
    CGRect r12 = CGRectMake(0,0,100,20);
    
    //打印属性
    //打印字符串
    NSLog(@"@",@"asdfasdf");
    
    //NSStringFromPoint(p1)
    //NSStringFromRect
    
//    CGSizeZero
//  CGRectZero
    
//    CGRectContainsPoint(<#CGRect rect#>, <#CGPoint point#>)

    
//    CGPointEqualToPoint(<#CGPoint point1#>, <#CGPoint point2#>)
    
    
    
    
    return 0;
}

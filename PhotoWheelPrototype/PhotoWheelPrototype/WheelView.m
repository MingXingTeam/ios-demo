//
//  WheelView.m
//  PhotoWheelPrototype
//
//  Created by maomao on 15/3/12.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import "WheelView.h"

@implementation WheelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize dataSource = _dataSource;

- (void) setAngle:(CGFloat) angle;{
    CGPoint center = CGPointMake(CGRectGetMidX([self bounds]),CGRectGetMidY([self bounds]));
    CGFloat radiusX = MIN([self bounds].size.width,[self bounds].size.height) * 0.35;
    CGFloat radiusY = radiusX;
    
    NSInteger cellCount = [[self dataSource] wheelViewNumberOfCells:self];
    float angleToAdd = 360.0f/cellCount;
    
    for(NSInteger index = 0; index < cellCount; index++){
        WheelViewCell *cell = [[self dataSource] wheelView:self cellAtIndex:index];
        if([cell superview] == nil){
            [self addSubview:cell];
        }
        
        float angleInRadians = (angle + 180.0) * M_PI / 180.0f;
        
        //Get a position based on the angle
        float xPosition = center.x + (radiusX * sinf(angleInRadians)) - (CGRectGetWidth([cell frame]) / 2);
        float yPosition = center.y + (radiusY * cosf(angleInRadians)) - (CGRectGetHeight([cell frame]) / 2);
        
        [cell setTransform:CGAffineTransformMakeTranslation(xPosition, yPosition)];
        
        //Work out what the next angle is going to be
        angle += angleToAdd;
    }
}
//显示WheelView的时候自动执行
- (void) layoutSubviews{
    [self setAngle:0];
}
@end

@implementation WheelViewCell

@end

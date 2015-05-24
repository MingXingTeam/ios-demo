//
//  WheelView.h
//  PhotoWheelPrototype
//
//  Created by maomao on 15/3/12.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WheelViewDataSource;
@class WheelViewCell;

typedef enum{
    WheelViewStyleWheel,
    WheelViewStyleCarousel,
}WheelViewStyle;

@interface WheelView : UIView

//数据源
@property (nonatomic,strong) IBOutlet id<WheelViewDataSource> dataSource;

//视图的风格
@property (nonatomic,assign) WheelViewStyle style;

@end

@protocol WheelViewDataSource <NSObject>

@required
- (NSInteger)wheelViewNumberOfCells:(WheelView *)wheelView;
- (WheelViewCell *)wheelView:(WheelView *)wheelView cellAtIndex:(NSInteger) index; 

@end

@interface WheelViewCell:UIView
@end
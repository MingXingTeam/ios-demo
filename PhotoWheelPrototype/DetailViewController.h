//

//  DetailViewController.h

//  PhotoWheelPrototype

//

//  Created by maomao on 15/3/1.

//  Copyright (c) 2015年 ths. All rights reserved.

//



#import <UIKit/UIKit.h>
#import "WheelView.h"


@interface DetailViewController : UIViewController<WheelViewDataSource>



@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;



@end


//
//  MasterViewController.h
//  PhotoWheelPrototype
//
//  Created by maomao on 15/3/1.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NameEditorViewController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <NameEditorViewControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

//保存相册集
@property (strong,nonatomic) NSMutableOrderedSet *data;

@end


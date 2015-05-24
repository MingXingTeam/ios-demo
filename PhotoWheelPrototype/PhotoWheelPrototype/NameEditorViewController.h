//
//  NameEditorViewController.h
//  PhotoWheelPrototype
//
//  Created by maomao on 15/3/11.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import <UIKit/UIKit.h>

//声明接口
@protocol NameEditorViewControllerDelegate;

@interface NameEditorViewController : UIViewController

//相册名编辑框
@property (strong,nonatomic) IBOutlet UITextField *nameTextField;
//子视图的委托
@property (strong,nonatomic) id<NameEditorViewControllerDelegate> delegate;
//集合索引
@property (strong,nonatomic) NSIndexPath *indexPath;

//编辑框默认的值
@property (strong,nonatomic) NSString *defaultNameText;

- (IBAction)cancel :(id)sender;
- (IBAction)done:(id)sender;
- (id)initWithDefaultNib;

@end

//定义接口
@protocol NameEditorViewControllerDelegate <NSObject>

@optional
- (void)nameEditorViewControllerDidFinish:(NameEditorViewController *)controller;
- (void)nameEditorViewControllerDidCancel:(NameEditorViewController *)controller;

@end

//
//  NameEditorViewController.m
//  PhotoWheelPrototype
//
//  Created by maomao on 15/3/11.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import "NameEditorViewController.h"

@interface NameEditorViewController ()

@end

@implementation NameEditorViewController

@synthesize nameTextField = _nameTextField;

@synthesize delegate = _delegate;

@synthesize indexPath = _indexPath;

@synthesize defaultNameText = _defaultNameText;

- (id)initWithDefaultNib{
    self = [super initWithNibName:@"NameEditorViewController" bundle:nil];
    if(self){
        //自定义初始化
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"载入");
    if([self isEditing]){
        [[self nameTextField] setText:[self defaultNameText]];
    }
    // Do any additional setup after loading the view from its nib.
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions methods

- (IBAction)cancel:(id)sender{
    id<NameEditorViewControllerDelegate> delegate = [self delegate];
    if(delegate && [delegate respondsToSelector:@selector(nameEditorViewControllerDidCancel:)]){
        [delegate nameEditorViewControllerDidCancel:self];
    }
//    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)done:(id)sender{
    id<NameEditorViewControllerDelegate> delegate = [self delegate];
    //判断delegate引用不为nil并且它的nameEditorViewControllerDidFinish:方法已经实现
    if(delegate && [delegate respondsToSelector:@selector(nameEditorViewControllerDidFinish:)]){
        [delegate nameEditorViewControllerDidFinish:self];
    }
//    [self dismissModalViewControllerAnimated:YES];
}

@end

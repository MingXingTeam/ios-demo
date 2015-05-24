//
//  ViewController.m
//  Attributor
//
//  Created by maomao on 15/3/27.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@end

@implementation ViewController
- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}
- (IBAction)outlineBodySelection:(UIButton *)sender {
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName:@-3,
                                           NSStrokeColorAttributeName:[UIColor blackColor]}
                                   range:self.body.selectedRange];
}

- (IBAction)unoutlineBodySelection:(UIButton *)sender {
    [self.body.textStorage removeAttribute:NSStrokeColorAttributeName
                                     range:self.body.selectedRange];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    [title setAttributes:@{NSStrokeWidthAttributeName:@3,//描边
                           NSStrokeColorAttributeName:self.outlineButton.tintColor }
                   range:NSMakeRange(0, [title length])];
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //为什么要加这一句：当视图出现的时候，监听，然后视图消失了移除监听。再设置了新的字体大小（广播发出去了，但是我已经没在监听了） 这行代码能同步系统字体
    [self usePreferredFonts];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontsChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillAppear:animated];
    //如果后面增加了一个新功能，监听了另外一个广播，当你视图消失时并不像该监听消失 这个写法就有问题了。
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //以下为比较好的方式
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];

}

-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFonts];
}

-(void)usePreferredFonts{
    //设置这个以后 之前设置的所有下划线什么的都失效了
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.headline.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}


@end

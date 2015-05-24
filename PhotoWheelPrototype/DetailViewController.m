//

//  DetailViewController.m

//  PhotoWheelPrototype

//

//  Created by maomao on 15/3/1.

//  Copyright (c) 2015年 ths. All rights reserved.

//



#import "DetailViewController.h"



@interface DetailViewController ()

@property (strong,nonatomic) NSArray *data;

@end



@implementation DetailViewController

@synthesize data = _data;

#pragma mark - Managing the detail item



- (void)setDetailItem:(id)newDetailItem {
    
    if (_detailItem != newDetailItem) {
        
        _detailItem = newDetailItem;
        
        
        
        // Update the view.
        
        [self configureView];
        
    }
    
}



- (void)configureView {
    
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        
        NSLog(@"%@",[self.detailItem description]);
        
        
        
        //为什么不起作用？
        
        //        [[self detailDescriptionLabel] setText:[self.detailItem description]];
        
        self.detailDescriptionLabel.text = [self.detailItem description];
        
    }
    
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    //创建10个WheelViewCell对象 并添加到data
    CGRect cellFrame = CGRectMake(0,0,75,75);
    NSInteger  count = 10;
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:count];
    for(NSInteger index = 0; index < count; index++){
        WheelViewCell *cell = [[WheelViewCell alloc] initWithFrame:cellFrame];
        [cell setBackgroundColor:[UIColor blueColor]];
        [newArray addObject:cell];
    }
    
    [self setData:[newArray copy]];
    
    [self configureView];
    
}



- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - WheelViewDataSource methods

- (NSInteger)wheelViewNumberOfCells:(WheelView *)wheelView{
    NSInteger count = [[self data] count];
    return count;
}


- (WheelViewCell *)wheelView:(WheelView *)wheelVIew cellAtIndex:(NSInteger)index{
    WheelViewCell *cell = [[self data] objectAtIndex:index];
    return cell;
}


@end


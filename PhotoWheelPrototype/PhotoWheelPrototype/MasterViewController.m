//
//  MasterViewController.m
//  PhotoWheelPrototype
//
//  Created by maomao on 15/3/1.
//  Copyright (c) 2015年 ths. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

//实现get和set方法
@synthesize data = _data;

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    self.clearsSelectionOnViewWillAppear = NO;
//    self.preferredContentSize = CGSizeMake(320.0, 600.0);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置标题
    self.title = NSLocalizedString(@"Photo Albums", @"Photo albums title");

    //添加add按钮以及绑定事件函数
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    //实例化数据，并添加两个相册示例
    [self setData:[[NSMutableOrderedSet alloc] init]];
    [[self data] addObject:@"A sample Photo Album"];
    [[self data] addObject:@"Another Photo Album"];
    //默认选择第一行
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
    
    //添加edit按钮
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

- (void)add:(id)sender {
    NSLog(@"%s",__PRETTY_FUNCTION__);
    //创建子控制器
    NameEditorViewController *newController = [[NameEditorViewController alloc] initWithDefaultNib];
    //设置子控制器的委托为MasterViewController
    [newController setDelegate:self];
    //设置子控制器的显示方式
    [newController setModalPresentationStyle:UIModalPresentationFormSheet];
    //显示子控制器
    [self presentModalViewController:newController animated:YES];
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    [self.objects insertObject:[NSDate date] atIndex:0];
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - NameEditorViewControllerDelegate

- (void)nameEditorViewControllerDidFinish:(NameEditorViewController *)controller{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    //获取nameTextField的文本
    NSString *newName = [[controller nameTextField] text];
    if(newName && [newName length] > 0){
        //如果子控制器是编辑状态
        if([controller isEditing]){
            //将所在的行的相册名改为新的名字
            [[self data] replaceObjectAtIndex:[[controller indexPath] row] withObject:newName];
        }else{
            //集合中添加元素
            [[self data] addObject:newName];
        }
        
        //表格视图重新载入数据
        [[self tableView] reloadData];
    }
}

- (void)nameEditorViewControllerDidCancel:(NameEditorViewController *)controller{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

//#pragma mark - Segues

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.objects[indexPath.row];
//        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
//        [controller setDetailItem:object];
//        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//        controller.navigationItem.leftItemsSupplementBackButton = YES;
//    }
//}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [[self data] count];
    return count;
//    return self.objects.count;
}

//每次显示子视图都会执行
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    //子视图出队列
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        //创建新的子视图
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //设置视图支持编辑模式
        [cell setEditingAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
        //设置重排模式
        [cell setShowsReorderControl:YES];
    }
    //配置cell
    NSString *text = [[self data] objectAtIndex: [indexPath row]];
    [[cell textLabel] setText:text];
    return cell;
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//
//    NSDate *object = self.objects[indexPath.row];
//    cell.textLabel.text = [object description];
//    return cell;
}

//重排执行的函数
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    [[self data] exchangeObjectAtIndex:[sourceIndexPath row] withObjectAtIndex:[destinationIndexPath row]];
}

//点击表格视图的行执行
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    //创建子视图
    NameEditorViewController *newController = [[NameEditorViewController alloc] initWithDefaultNib];
    NSLog(@"编辑");
    [newController setDelegate:self];
    [newController setEditing:YES];
    [newController setIndexPath:indexPath];
    NSString *name = [[self data] objectAtIndex:[indexPath row]];
    
    //[[newController nameTextField] setText:name];
    [newController setDefaultNameText:name];
    
    [newController setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentModalViewController:newController animated:YES];
}

//删除数据
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

//编辑行执行
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //如果编辑模式是删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除集合中的数据
        [[self data] removeObjectAtIndex:[indexPath row]];
        //删除当前行
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

//选择行时执行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    //获取选择行的相册名
    NSString *name = [[self data] objectAtIndex:[indexPath row]];
    //设置详细视图的名字
    [[self detailViewController] setDetailItem:name];
}

@end

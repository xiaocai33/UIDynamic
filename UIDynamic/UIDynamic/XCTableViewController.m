//
//  XCTableViewController.m
//  UIDynamic
//
//  Created by 小蔡 on 16/3/11.
//  Copyright © 2016年 xiaocai. All rights reserved.
//
/** 三大步骤：
 （1）创建一个物理仿真器（顺便设置仿真范围）
 （2）创建物理仿真行为（添加物理仿真元素）
 （3）将物理仿真行为添加到物理仿真器中
 */


#import "XCTableViewController.h"
@interface XCTableViewController()

@property (nonatomic, strong) NSArray *names;

@end

@implementation XCTableViewController
- (NSArray *)names{
    if (_names == nil) {
        _names = @[@"重力演示", @"碰撞演示", @"吸附演示"];
    }
    return _names;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    //设置窗口颜色
    self.view.backgroundColor = [UIColor orangeColor];
    //设置标题
    self.navigationItem.title = @"物理仿真演示";
    
}

#pragma mark -- UITableViewController数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    //设置cell选中的样式
    //cell.selectionStyle = UITableViewCellAccessoryCheckmark;
    cell.textLabel.text = self.names[indexPath.row];
    return cell;
}

#pragma mark -- UITableViewController代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%zi", indexPath.row);
}

@end














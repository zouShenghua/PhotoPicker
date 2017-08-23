//
//  ViewController.m
//  WeiboPhotoPicker
//
//  Created by 维奕 on 2017/8/23.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import "ViewController.h"
#import "Demo1ViewController.h"
#import "Demo2ViewController.h"
#import "Demo3ViewController.h"
#import "Demo4ViewController.h"
#import "Demo5ViewController.h"
#import "Demo6ViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (copy, nonatomic) NSArray *list;
@property(strong,nonatomic)UITableView *TabV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.view addSubview:self.TabV];
    
}


- (NSArray *)list
{
    if (!_list) {
        _list = @[@"Demo1-只使用照片选择功能,不带选好后自动布局(可扩展)",@"Demo2-使用照片选择功能并且选好后自动布局",@"Demo3-附带网络照片功能",@"Demo4-单选样式支持裁剪",@"Demo5-同个界面多个选择器",@"Demo6-拍照/选择照片完之后跳界面"];
    }
    return _list;
}



#pragma mark 表格创建
-(UITableView *)TabV{
    if (_TabV==nil) {
        _TabV=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _TabV.delegate=self;
        _TabV.dataSource=self;
    }
    return _TabV;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.000001;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld---%ld",(long)indexPath.section,(long)indexPath.row);
    if (indexPath.row == 0) {
        Demo1ViewController *vc = [[Demo1ViewController alloc] init];
        vc.title = @"Demo1";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1) {
        Demo2ViewController *vc = [[Demo2ViewController alloc] init];
        vc.title = @"Demo2";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2) {
        Demo3ViewController *vc = [[Demo3ViewController alloc] init];
        vc.title = @"Demo3";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3) {
        Demo4ViewController *vc = [[Demo4ViewController alloc] init];
        vc.title = @"Demo4";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4) {
        Demo5ViewController *vc = [[Demo5ViewController alloc] init];
        vc.title = @"Demo5";
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5) {
        Demo6ViewController *vc = [[Demo6ViewController alloc] init];
        vc.title = @"Demo6";
        [self.navigationController pushViewController:vc animated:YES];
    }

    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellStr=@"cell";
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellStr];
    cell.textLabel.text=self.list[indexPath.row];
    return cell;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  Demo6SubViewController.m
//  WeiboPhotoPicker
//
//  Created by 维奕 on 2017/8/23.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import "Demo6SubViewController.h"
#import "HXPhotoView.h"
@interface Demo6SubViewController ()<HXPhotoViewDelegate>

@end

@implementation Demo6SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
    CGFloat width = self.view.frame.size.width;
    HXPhotoView *photoView = [HXPhotoView photoManager:self.manager];
    photoView.frame = CGRectMake(12, 100, width - 24, 0);
    photoView.delegate = self;
    photoView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:photoView]; 
}

- (void)dealloc { 
    [self.manager clearSelectedList];
}

@end

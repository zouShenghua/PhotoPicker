//
//  Demo5ViewController.m
//  WeiboPhotoPicker
//
//  Created by 维奕 on 2017/8/23.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import "Demo5ViewController.h"
#import "HXPhotoView.h" 
@interface Demo5ViewController ()<HXPhotoViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) HXPhotoView *onePhotoView;
@property (strong, nonatomic) HXPhotoManager *oneManager;
@property (strong, nonatomic) HXPhotoView *twoPhotoView;
@property (strong, nonatomic) HXPhotoManager *twoManager;
@property (strong, nonatomic) HXPhotoView *threePhotoView;
@property (strong, nonatomic) HXPhotoManager *threeManager;
@end

@implementation Demo5ViewController

- (HXPhotoManager *)oneManager {
    if (!_oneManager) {
        _oneManager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        
    }
    return _oneManager;
}

- (HXPhotoManager *)twoManager {
    if (!_twoManager) {
        _twoManager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypeVideo];
        
    }
    return _twoManager;
}

- (HXPhotoManager *)threeManager {
    if (!_threeManager) {
        _threeManager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
        
    }
    return _threeManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.scrollView];
    
    self.onePhotoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 0) WithManager:self.oneManager];
    self.onePhotoView.delegate = self;
    [self.scrollView addSubview:self.onePhotoView];
    
    self.twoPhotoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.onePhotoView.frame) + 20, self.view.frame.size.width, 0) WithManager:self.twoManager];
    self.twoPhotoView.delegate = self;
    [self.scrollView addSubview:self.twoPhotoView];
    
    self.threePhotoView = [[HXPhotoView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.twoPhotoView.frame) + 20, self.view.frame.size.width, 0) WithManager:self.threeManager];
    self.threePhotoView.delegate = self;
    [self.scrollView addSubview:self.threePhotoView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"清空" style:UIBarButtonItemStylePlain target:self action:@selector(didCleanClick)];
}
- (void)didCleanClick {
    [self.oneManager clearSelectedList];
    [self.twoManager clearSelectedList];
    [self.threeManager clearSelectedList];
    [self.onePhotoView refreshView];
    [self.twoPhotoView refreshView];
    [self.threePhotoView refreshView];
}
- (void)photoView:(HXPhotoView *)photoView changeComplete:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photos videos:(NSArray<HXPhotoModel *> *)videos original:(BOOL)isOriginal {
    if (self.onePhotoView == photoView) {
        NSSLog(@"onePhotoView - %@",allList);
    }else if (self.twoPhotoView == photoView) {
        NSSLog(@"twoPhotoView - %@",allList);
    }else if (self.threePhotoView == photoView) {
        NSSLog(@"threePhotoView - %@",allList);
    }
}
- (void)photoView:(HXPhotoView *)photoView updateFrame:(CGRect)frame {
    if (self.onePhotoView == photoView) {
        self.twoPhotoView.frame = CGRectMake(0, CGRectGetMaxY(self.onePhotoView.frame) + 20, self.view.frame.size.width, self.twoPhotoView.frame.size.height);
        self.threePhotoView.frame = CGRectMake(0, CGRectGetMaxY(self.twoPhotoView.frame) + 20, self.view.frame.size.width, self.threePhotoView.frame.size.height);
    }else if (self.twoPhotoView == photoView) {
        self.twoPhotoView.frame = CGRectMake(0, CGRectGetMaxY(self.onePhotoView.frame) + 20, self.view.frame.size.width, self.twoPhotoView.frame.size.height);
        self.threePhotoView.frame = CGRectMake(0, CGRectGetMaxY(self.twoPhotoView.frame) + 20, self.view.frame.size.width, self.threePhotoView.frame.size.height);
    }else if (self.threePhotoView == photoView) {
        self.threePhotoView.frame = CGRectMake(0, CGRectGetMaxY(self.twoPhotoView.frame) + 20, self.view.frame.size.width, frame.size.height);
    }
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(self.threePhotoView.frame) + 100);
}

@end

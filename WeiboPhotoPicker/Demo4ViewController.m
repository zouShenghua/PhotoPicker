//
//  Demo4ViewController.m
//  WeiboPhotoPicker
//
//  Created by 维奕 on 2017/8/23.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import "Demo4ViewController.h"
#import "HXPhotoViewController.h"

@interface Demo4ViewController ()<HXPhotoViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) HXPhotoManager *manager;
@end

@implementation Demo4ViewController
- (HXPhotoManager *)manager {
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _manager.openCamera = YES;
        _manager.singleSelected = YES;
        //        _manager.singleSelecteClip = NO;
        _manager.cameraType = HXPhotoManagerCameraTypeFullScreen;
    }
    return _manager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)selectedPhoto:(id)sender {
    HXPhotoViewController *vc = [[HXPhotoViewController alloc] init];
    vc.manager = self.manager;
    vc.delegate = self;
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
}
- (void)photoViewControllerDidNext:(NSArray<HXPhotoModel *> *)allList Photos:(NSArray<HXPhotoModel *> *)photos Videos:(NSArray<HXPhotoModel *> *)videos Original:(BOOL)original { 
    __weak typeof(self) weakSelf = self;
    [HXPhotoTools getImageForSelectedPhoto:photos type:0 completion:^(NSArray<UIImage *> *images) {
        weakSelf.imageView.image = images.firstObject;
    }];
} 

- (void)photoViewControllerDidCancel {
    
}
 

@end

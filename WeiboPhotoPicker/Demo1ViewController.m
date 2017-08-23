//
//  Demo1ViewController.m
//  WeiboPhotoPicker
//
//  Created by 维奕 on 2017/8/23.
//  Copyright © 2017年 维奕. All rights reserved.
//

#import "Demo1ViewController.h"
#import "HXPhotoViewController.h"

@interface Demo1ViewController ()<HXPhotoViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UILabel *photo;
@property (weak, nonatomic) IBOutlet UILabel *video;
@property (weak, nonatomic) IBOutlet UILabel *original;
@property (weak, nonatomic) IBOutlet UISwitch *camera;
@property (strong, nonatomic) HXPhotoManager *manager;
@property (weak, nonatomic) IBOutlet UITextField *photoText;
@property (weak, nonatomic) IBOutlet UITextField *videoText;
@property (weak, nonatomic) IBOutlet UITextField *columnText;
@property (weak, nonatomic) IBOutlet UISwitch *addCamera;
@property (weak, nonatomic) IBOutlet UISwitch *outerCamera;

@end

@implementation Demo1ViewController

- (HXPhotoManager *)manager
{
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhotoAndVideo];
        _manager.videoMaxNum = 5;
        _manager.cacheAlbum = NO; 
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)goAlbum:(id)sender {
    self.camera.on = NO;
    self.manager.photoMaxNum = self.photoText.text.integerValue;
    self.manager.videoMaxNum = self.videoText.text.integerValue;
    self.manager.rowCount = self.columnText.text.integerValue;
    HXPhotoViewController *vc = [[HXPhotoViewController alloc] init];
    vc.delegate = self;
    vc.manager = self.manager;
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:vc] animated:YES completion:nil];
}

- (void)photoViewControllerDidNext:(NSArray *)allList Photos:(NSArray *)photos Videos:(NSArray *)videos Original:(BOOL)original
{
    self.total.text = [NSString stringWithFormat:@"%ld个",allList.count];
    self.photo.text = [NSString stringWithFormat:@"%ld张",photos.count];
    self.video.text = [NSString stringWithFormat:@"%ld个",videos.count];
    self.original.text = original ? @"YES" : @"NO";
    NSSLog(@"all - %@",allList);
    NSSLog(@"photo - %@",photos);
    NSSLog(@"video - %@",videos);
}

- (void)photoViewControllerDidCancel
{
    NSSLog(@"取消");
}

- (IBAction)camera:(id)sender {
    UISwitch *sw = (UISwitch *)sender;
    
    self.manager.goCamera = sw.on;
}
- (IBAction)same:(id)sender {
    UISwitch *sw = (UISwitch *)sender;
    self.manager.selectTogether = sw.on;
}

- (IBAction)isLookGIFPhoto:(UISwitch *)sender {
    self.manager.lookGifPhoto = sender.on;
}

- (IBAction)isLookLivePhoto:(UISwitch *)sender {
    self.manager.lookLivePhoto = sender.on;
}

- (IBAction)outerCamera:(id)sender {
}

- (IBAction)addCamera:(id)sender {
    UISwitch *sw = (UISwitch *)sender;
    self.manager.openCamera = sw.on;
}

@end

#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "HXAlbumListView.h"
#import "HXAlbumModel.h"
#import "HXAlbumTitleButton.h"
#import "HXCameraPreviewViewController.h"
#import "HXCameraViewController.h"
#import "HXCircleProgressView.h"
#import "HXCollectionView.h"
#import "HXFullScreenCameraPlayView.h"
#import "HXFullScreenCameraViewController.h"
#import "HXPhotoConst.h"
#import "HXPhotoEditView.h"
#import "HXPhotoEditViewController.h"
#import "HXPhotoManager.h"
#import "HXPhotoModel.h"
#import "HXPhotoPreviewViewCell.h"
#import "HXPhotoPreviewViewController.h"
#import "HXPhotoResultModel.h"
#import "HXPhotoSubViewCell.h"
#import "HXPhotoTools.h"
#import "HXPhotoUIManager.h"
#import "HXPhotoView.h"
#import "HXPhotoViewCell.h"
#import "HXPhotoViewController.h"
#import "HXPresentTransition.h"
#import "HXTransition.h"
#import "HXVideoPresentTransition.h"
#import "HXVideoPreviewViewController.h"
#import "NSBundle+HXWeiboPhotoPicker.h"
#import "UIButton+HXExtension.h"
#import "UIImage+HXExtension.h"
#import "UIView+HXExtension.h"

FOUNDATION_EXPORT double HXWeiboPhotoPickerVersionNumber;
FOUNDATION_EXPORT const unsigned char HXWeiboPhotoPickerVersionString[];


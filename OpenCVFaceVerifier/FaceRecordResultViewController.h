//
//  FaceRecordResultViewController.h
//  OpenCVFaceVerifier
//
//  Created by LaoWen on 16/5/17.
//  Copyright © 2016年 LaoWen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceRecordResultViewController;

@protocol FaceRecordResultViewControllerDelegate <NSObject>

@optional;
//确认
- (void)faceRecordResultViewControllerConfirm:(FaceRecordResultViewController *)faceRecordResultVC;

//取消
- (void)faceRecordResultViewControllerCancel:(FaceRecordResultViewController *)faceRecordResultVC;

@end

@interface FaceRecordResultViewController : UIViewController

@property (nonatomic, retain)UIImage *faceImage;
@property (nonatomic, weak)id<FaceRecordResultViewControllerDelegate> delegate;

@end

//
//  FaceVerifyResultViewController.h
//  OpenCVFaceVerifier
//
//  Created by LaoWen on 16/5/17.
//  Copyright © 2016年 LaoWen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceVerifyResultViewController;

@protocol FaceVerifyResultViewControllerDelegate <NSObject>

- (void)faceVerifyResultViewControllerConfirm:(FaceVerifyResultViewController *)faceVerifyResultVC;

@end

@interface FaceVerifyResultViewController : UIViewController

@property (nonatomic, strong)UIImage *faceImage;
@property (nonatomic, unsafe_unretained)double confidence;
@property (nonatomic, weak) id<FaceVerifyResultViewControllerDelegate> delegate;

@end

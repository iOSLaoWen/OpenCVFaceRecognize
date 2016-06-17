//
//  FaceVerifyViewController.m
//  OpenCVFaceVerifier
//
//  Created by LaoWen on 16/5/17.
//  Copyright © 2016年 LaoWen. All rights reserved.
//

#import "LWFaceDetector.h"
#import "FaceVerifyResultViewController.h"
#import "FaceVerifyViewController.h"

@interface FaceVerifyViewController ()<LWFaceDetectorDelegate>
@property (weak, nonatomic) IBOutlet UIView *cameraView;

@property (nonatomic, strong) LWFaceDetector *faceDetector;
@end

@implementation FaceVerifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.faceDetector = [[LWFaceDetector alloc]initWithCameraView:self.cameraView];
    self.faceDetector.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.faceDetector startCapture];
    [self.faceDetector startVerify];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.faceDetector stopCapture];
}

//人脸验证通过
- (void)onFaceVerified:(NSDictionary *)args
{
    UIImage *faceImage = args[@"faceImage"];
    double confidence = [args[@"confidence"] doubleValue];
    //dispatch_sync(dispatch_get_main_queue(), ^{
        FaceVerifyResultViewController *faceVerifyResultVC = [[FaceVerifyResultViewController alloc]init];
        faceVerifyResultVC.faceImage = faceImage;
        faceVerifyResultVC.confidence = confidence;
        [self.navigationController pushViewController:faceVerifyResultVC animated:YES];
    //});
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

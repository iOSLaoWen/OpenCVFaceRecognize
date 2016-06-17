//
//  FaceRecordViewController.m
//  OpenCVFaceVerifier
//
//  Created by LaoWen on 16/5/17.
//  Copyright © 2016年 LaoWen. All rights reserved.
//

#import "FaceRecordViewController.h"
#import "LWFaceDetector.h"
#import "FaceRecordResultViewController.h"

@interface FaceRecordViewController ()<LWFaceDetectorDelegate, FaceRecordResultViewControllerDelegate>
{
    NSInteger _count;
}
@property (weak, nonatomic) IBOutlet UIView *cameraView;
@property (weak, nonatomic) IBOutlet UILabel *message;

@property (nonatomic, strong) LWFaceDetector *faceDetector;
@end

@implementation FaceRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"mainThread: %@", [NSThread currentThread]);
    self.faceDetector = [[LWFaceDetector alloc]initWithCameraView:self.cameraView];
    self.faceDetector.delegate = self;
}

//人脸检测时的一些提示信息
- (void)onMessage:(NSString *)message
{
    self.message.text = message;
}

//检测到人脸
- (void)onFaceDetected:(UIImage *)faceImage
{
    //dispatch_sync(dispatch_get_main_queue(), ^{
        //跳到确认页面
    NSThread *currentThread = [NSThread currentThread];
    NSLog(@"currentThread:%@", currentThread);
        FaceRecordResultViewController *faceRecordResultVC = [[FaceRecordResultViewController alloc]init];
        faceRecordResultVC.faceImage = faceImage;
        faceRecordResultVC.delegate = self;
        [self.navigationController pushViewController:faceRecordResultVC animated:YES];
    //});
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.faceDetector startCapture];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.faceDetector stopCapture];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.faceDetector startRecord];
}

- (void)faceRecordResultViewControllerConfirm:(FaceRecordResultViewController *)faceRecordResultVC
{
    [self.faceDetector recordFace];
    _count++;
    if (_count == 3) {
        [self.navigationController popToViewController:self.navigationController.viewControllers[self.navigationController.viewControllers.count-3] animated:YES];//回到前一个页面
    } else {
        [self.navigationController popViewControllerAnimated:YES];//回到当前页面
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

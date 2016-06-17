//
//  ViewController.m
//  OpenCVFaceVerifier
//
//  Created by LaoWen on 16/5/12.
//  Copyright © 2016年 LaoWen. All rights reserved.
//

//基于OpenCV的一个人脸识别程序，基本功能如下：
//1. 人脸检测：将检测到的人脸用矩形框标出来
//2. 人脸录入：录入人脸数据（一个人的）
//3. 人脸识别：如果摄像头中检测到的人脸与之前录入的相同则报告验证通过


#import "ViewController.h"
#import "LWFaceDetector.h"

@interface ViewController ()<LWFaceDetectorDelegate, UIAlertViewDelegate>
{
    int _recordCount;
}
@property (weak, nonatomic) IBOutlet UIImageView *cameraView;
@property (nonatomic, strong) LWFaceDetector *faceDetector;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.faceDetector = [[LWFaceDetector alloc]initWithCameraView:self.cameraView];
    self.faceDetector.delegate = self;
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

- (IBAction)onBtnRecordClicked:(id)sender {
    [self.faceDetector startRecord];
}

- (IBAction)onBtnVerifyClicked:(id)sender {
    [self.faceDetector startVerify];
}

- (IBAction)onBtnCaptureClicked:(id)sender {
    [self.faceDetector startCapture];
}

- (void)onFaceDetected:(UIImage *)faceImage
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"检测到人脸");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"检测到人脸" message:@"满意请确认，不满意取消" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        [alert show];
    });
}

- (void)onFaceVerified:(UIImage *)faceImage confidence:(double)confidence
{
    NSString *message = [NSString stringWithFormat:@"人脸验证完成，confidence:%f", confidence];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"检测到人脸");
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"检测到人脸" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
        [alert show];
    });
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {//确认
        [self.faceDetector recordFace];
        _recordCount++;
        if (_recordCount < 3) {//录入3次
            [self.faceDetector startCapture];
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

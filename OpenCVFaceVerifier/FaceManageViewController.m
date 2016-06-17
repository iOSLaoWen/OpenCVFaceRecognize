//
//  FaceManageViewController.m
//  OpenCVFaceVerifier
//
//  Created by LaoWen on 16/5/17.
//  Copyright © 2016年 LaoWen. All rights reserved.
//

#import "FaceManageViewController.h"
#import "FaceRecordViewController.h"
#import "FaceVerifyViewController.h"

@interface FaceManageViewController ()

@end

@implementation FaceManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//进入录入人脸页面
- (IBAction)onBtnFaceRecordClicked:(id)sender {
    FaceRecordViewController *faceRecord = [[FaceRecordViewController alloc]init];
    [self.navigationController pushViewController:faceRecord animated:YES];
}

//进入人脸验证页面
- (IBAction)onBtnFaceVerifyClicked:(id)sender {
    FaceVerifyViewController *faceVerify = [[FaceVerifyViewController alloc]init];
    [self.navigationController pushViewController:faceVerify animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  FaceRecordResultViewController.m
//  OpenCVFaceVerifier
//
//  Created by LaoWen on 16/5/17.
//  Copyright © 2016年 LaoWen. All rights reserved.
//

#import "FaceRecordResultViewController.h"

@interface FaceRecordResultViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FaceRecordResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imageView.image = self.faceImage;
}

//确认
- (IBAction)onBtnOKClicked:(id)sender {
    if ([_delegate respondsToSelector:@selector(faceRecordResultViewControllerConfirm:)]) {
        [_delegate faceRecordResultViewControllerConfirm:self];
    }
    //[self.navigationController popViewControllerAnimated:YES];
}

//取消
- (IBAction)onBtnCancelClicked:(id)sender {
    if ([_delegate respondsToSelector:@selector(faceRecordResultViewControllerCancel:)]) {
        [_delegate faceRecordResultViewControllerCancel:self];
    }
    //[self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

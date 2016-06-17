//
//  FaceVerifyResultViewController.m
//  OpenCVFaceVerifier
//
//  Created by LaoWen on 16/5/17.
//  Copyright © 2016年 LaoWen. All rights reserved.
//

#import "FaceVerifyResultViewController.h"

@interface FaceVerifyResultViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation FaceVerifyResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imageView.image = self.faceImage;
    self.label.text = [NSString stringWithFormat:@"%f", self.confidence];
}

- (IBAction)onBtnConfirmClicked:(id)sender {
    if ([_delegate respondsToSelector:@selector(faceVerifyResultViewControllerConfirm:)]) {
        [_delegate faceVerifyResultViewControllerConfirm:self];
    }

    [self.navigationController popToViewController:self.navigationController.viewControllers[self.navigationController.viewControllers.count-3] animated:YES];//回到前二个页面
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

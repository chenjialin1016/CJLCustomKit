//
//  CJLViewController.m
//  CJLCustomKit
//
//  Created by chenjialin1016 on 11/10/2020.
//  Copyright (c) 2020 chenjialin1016. All rights reserved.
//

#import "CJLViewController.h"
#import "CJLCustomKit/CJLCountDownButton.h"
//#import "CJLCustomKit/CJLConditionLock.h"

@interface CJLViewController ()

@end

@implementation CJLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CJLCountDownButton *btn = [CJLCountDownButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(80, 200, 100, 44);
    [btn setTitle:@"开始" forState:UIControlStateNormal];
    btn.backgroundColor = UIColor.blueColor;
    [self.view addSubview:btn];
    
    
    [btn CJLCountDownBtnTouched:^void (CJLCountDownButton *sender, NSUInteger tag) {
        sender.enabled = NO;
        [sender startCountDownWithSecond:10];

    } Changing:^NSString *(CJLCountDownButton *sender, NSUInteger second) {
        NSString *title = [NSString stringWithFormat:@"%zd秒", second];
        return title;
    } Finished:^NSString *(CJLCountDownButton *sender, NSUInteger second) {
        sender.enabled = YES;
        return @"重新获取";
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

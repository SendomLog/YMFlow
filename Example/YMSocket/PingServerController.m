// Tencent is pleased to support the open source community by making Mars available.
// Copyright (C) 2016 THL A29 Limited, a Tencent company. All rights reserved.

// Licensed under the MIT License (the "License"); you may not use this file except in 
// compliance with the License. You may obtain a copy of the License at
// http://opensource.org/licenses/MIT

// Unless required by applicable law or agreed to in writing, software distributed under the License is
// distributed on an "AS IS" basis, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied. See the License for the specific language governing permissions and
// limitations under the License.

//
//  PingServerController.m
//  iOSDemo
//
//  Created by caoshaokun on 16/11/25.
//  Copyright © 2016年 caoshaokun. All rights reserved.
//

#import "PingServerController.h"
#import "YMAppDelegate.h"
#import "LoginViewController.h"
//#import "YMFlow.h"
#import <YMFlow/YMFlow.h>

@interface PingServerController ()<YMFlowDelegate>

@end

@implementation PingServerController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIStoryboard *sb= [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LoginViewController *lvc = [sb instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.tabBarController presentViewController:lvc animated:YES completion:nil];
    });
}

- (void)onConnectionStatusChange:(YMFlowStatus)status longConnStatus:(YMFlowStatus)longConnStatus {
}

- (NSString *)username {
    return [(YMAppDelegate *)[UIApplication sharedApplication].delegate username];
}

- (IBAction)onButtonClick:(UIButton *)sender forEvent:(UIEvent *)event {
    static int taskID;
    if (sender.tag == 0) {
        taskID = 0;
        [YMFlow initializeFlow];
        [YMFlow setIp:@"118.25.48.118" backupIps:@[@"123.207.141.127", @"115.159.218.155", @"118.25.48.118"] port:5125];
        [YMFlow connect];
        [YMFlow setFlowCallback:self];
    } else if (sender.tag == 1) {
        NSString *user = self.username;
        taskID = [YMFlow sendMessage:[NSString stringWithFormat:@"%@, hello world", user] taskCallback:^(YMFlowTask * _Nonnull taskInfo) {
            NSLog(@"%@", taskInfo.request);
            NSLog(@"%@", taskInfo.response);
        }];
    } else if (sender.tag == 2) {
        [YMFlow cancelTaskWithID:taskID];
    } else if (sender.tag == 3) {
        taskID = 0;
         [YMFlow destroy];
    }
}

@end

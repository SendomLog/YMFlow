//
//  YMAppDelegate.m
//  YMSocket
//
//  Created by CaffreySun on 01/28/2019.
//  Copyright (c) 2019 CaffreySun. All rights reserved.
//

#import "YMAppDelegate.h"
#import <YMFlow/YMFlow.h>

@implementation YMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [YMFlow setForeground:NO];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [YMFlow setForeground:YES];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [YMFlow destroy];
}

@end

//
//  AppDelegate.m
//  SilentRunnerDemoApp
//
//  Created by andrew batutin on 2/17/17.
//  Copyright © 2017 HomeOfRisingSun. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    BOOL res =  application.isIgnoringInteractionEvents;
    NSLog(@"sdfdsf");
}


@end

//
//  AppDelegate.m
//  GeTuiDemo
//
//  Created by iwind on 15/5/13.
//  Copyright (c) 2015年 HanYang. All rights reserved.
//

#import "AppDelegate.h"
#import "GexinSdk.h"
#import "ViewController.h"

#define APPKEY @"YKfRxnvSLVAfTyMo6ASJS3"
#define APPSECRET @"xQIzUTlTap5c1ocM3FkKg8"
#define APPID @"rnV4CJDeOq9UyXNnnwR2x3"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController * vc = [[ViewController alloc]init];
    UINavigationController * navi = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    
    [self startSDK];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Push server

@synthesize gexinPusher = _gexinPusher;
@synthesize clientID = _clientID;
@synthesize sdkStatus = _sdkStatus;
@synthesize lastPayloadIndex = _lastPayloadIndex;
@synthesize payloadID = _payloadID;


- (void)startSDK
{
    if (!_gexinPusher) {
        _sdkStatus = SdkStatusStopped;
        _clientID = nil;
        
        NSError * err = nil;
        _gexinPusher = [GexinSdk createSdkWithAppId:APPID appKey:APPKEY appSecret:APPSECRET appVersion:@"1.0.0" delegate:self error:&err];
        if (!_gexinPusher) {
            NSLog(@"startSDK");
            NSLog(@"%@",[NSString stringWithFormat:@"%@",[err localizedDescription]]);
        }else{
            _sdkStatus = SdkStatusStarting;
        }
        
        NSLog(@"PushStatus:%u",_sdkStatus);
        
    }
}

- (void)stopSDK
{
    if (_gexinPusher) {
        [_gexinPusher destroy];
        _gexinPusher = nil;
        
        _sdkStatus = SdkStatusStopped;
        
        _clientID = nil;
        
        NSLog(@"PushStatus:%u",_sdkStatus);

        
    }
}


@end

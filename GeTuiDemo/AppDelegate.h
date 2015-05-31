//
//  AppDelegate.h
//  GeTuiDemo
//
//  Created by iwind on 15/5/13.
//  Copyright (c) 2015年 HanYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GexinSdk.h"
#import "ViewController.h"

typedef enum{
    SdkStatusStopped,
    SdkStatusStarting,
    SdkStatusStarted
} SdkStatus;

@interface AppDelegate : UIResponder <UIApplicationDelegate,GexinSdkDelegate>{
@private
//    UINavigationController *_naviController;
    NSString *_deviceToken;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

//个推属性
@property (strong, nonatomic) GexinSdk *gexinPusher;

@property (retain, nonatomic) NSString *appKey;
@property (retain, nonatomic) NSString *appSecret;
@property (retain, nonatomic) NSString *appID;
@property (retain, nonatomic) NSString *clientId;
@property (assign, nonatomic) SdkStatus sdkStatus;
@property (assign, nonatomic) int lastPayloadIndex;
@property (retain, nonatomic) NSString *payloadId;

#pragma mark - Push Server
///创建个推SDK
- (void)startSdkWith:(NSString *)appID appKey:(NSString *)appKey appSecret:(NSString *)appSecret;
- (void)stopSdk;

- (void)setDeviceToken:(NSString *)aToken;
- (BOOL)setTags:(NSArray *)aTag error:(NSError **)error;
- (NSString *)sendMessage:(NSData *)body error:(NSError **)error;

- (void)bindAlias:(NSString *)aAlias;
- (void)unbindAlias:(NSString *)aAlias;

//- (void)testSdkFunction;
//- (void)testSendMessage;
//- (void)testGetClientId;




@end


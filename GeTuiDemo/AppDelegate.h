//
//  AppDelegate.h
//  GeTuiDemo
//
//  Created by iwind on 15/5/13.
//  Copyright (c) 2015年 HanYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GexinSdk.h"

typedef enum{
    SdkStatusStopped,
    SdkStatusStarting,
    SdkStatusStarted
} SdkStatus;

@interface AppDelegate : UIResponder <UIApplicationDelegate,GexinSdkDelegate>

@property (strong, nonatomic) UIWindow *window;

#pragma mark - Push Server
@property (nonatomic, strong) GexinSdk * gexinPusher;
@property (nonatomic, strong) NSString * clientID;
@property (nonatomic, assign) SdkStatus sdkStatus;

@property (nonatomic, assign) NSInteger lastPayloadIndex;
@property (nonatomic, strong) NSString * payloadID;

- (void)startSDK;
- (void)stopSDK;

- (void)setDeviceToken:(NSString *)aToken;
- (BOOL)setTags:(NSArray *)aTag error:(NSError *)error;

- (void)bindAlias:(NSString *)aAlias;
- (void)unbindAlias:(NSString *)aAlias;

- (void)testSDKFunction;
- (void)testGetClientI;


@end


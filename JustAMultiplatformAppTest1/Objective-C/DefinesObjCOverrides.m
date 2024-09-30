//
//  DefinesObjCOverrides.m
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 07/29/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DefinesObjCOverrides.h"

#import "JmObjCSwiftEnvBridge-Bridging-Header.h"

@implementation DefinesObjCOverrides
{

    JmObjCSwiftEnvBridge *_jmObjCSwiftEnvBridge;

}

- (void)initInstance
{

    NSLog(@"--- Defines.initInstance() - Invoked...");
//  NSLogv(@"--- Defines.initInstance() - Invoked...", NULL);

    _jmObjCSwiftEnvBridge = JmObjCSwiftEnvBridge.sharedEnvBridge;

//    NSLogv(@"--- Defines.initInstance() - Exiting - '_jmObjCSwiftEnvBridge' is [%@] ---", (__bridge struct __va_list_tag *)(_jmObjCSwiftEnvBridge));
    NSLog(@"--- Defines.initInstance() - Exiting...");

}

- (void)customLoggerTest1:(NSString * _Nullable)message
{

    NSLog(@"--- Defines.customLoggerTest1() - Invoked ---");
//  NSLogv(@"--- Defines.customLoggerTest1() - Invoked - Parameter 'message': %@", (__bridge struct __va_list_tag *)(message));
    
    if (_jmObjCSwiftEnvBridge) {
//        NSLogv(@"--- Defines.customLoggerTest1() - Test - '_jmObjCSwiftEnvBridge' is NOT Null - is [%@] ---", (__bridge struct __va_list_tag *)(_jmObjCSwiftEnvBridge));
        [_jmObjCSwiftEnvBridge jmLogMsg:message];
        NSLog(@"--- Defines.customLoggerTest1() - Intermediate - parameter 'message' is [%@] ---", message);
    } else {
//      NSLogv(@"--- Defines.customLoggerTest1() - Test - '_jmObjCSwiftEnvBridge' is NULL - Error! ---", NULL);
        NSLog(@"--- Defines.customLoggerTest1() - Test - '_jmObjCSwiftEnvBridge' is NULL - Error! ---");
    }

    NSLog(@"--- Defines.customLoggerTest1() - Exiting ---");
//  NSLogv(@"--- Defines.customLoggerTest1() - Exiting ---", NULL);

}

@end

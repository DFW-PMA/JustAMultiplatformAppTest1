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

- (void)customLogger:(NSString * _Nullable)message
{

    NSLog(@"--- Defines.customLogger() - Invoked ---");
//  NSLogv(@"--- Defines.customLogger() - Invoked - Parameter 'message': %@", (__bridge struct __va_list_tag *)(message));
    
    if (_jmObjCSwiftEnvBridge) {
//        NSLogv(@"--- Defines.customLogger() - Test - '_jmObjCSwiftEnvBridge' is NOT Null - is [%@] ---", (__bridge struct __va_list_tag *)(_jmObjCSwiftEnvBridge));
        [_jmObjCSwiftEnvBridge jmLogMsg:message];
    } else {
//      NSLogv(@"--- Defines.customLogger() - Test - '_jmObjCSwiftEnvBridge' is NULL - Error! ---", NULL);
        NSLog(@"--- Defines.customLogger() - Test - '_jmObjCSwiftEnvBridge' is NULL - Error! ---");
    }

    NSLog(@"--- Defines.customLogger() - Exiting ---");
//  NSLogv(@"--- Defines.customLogger() - Exiting ---", NULL);

}

@end

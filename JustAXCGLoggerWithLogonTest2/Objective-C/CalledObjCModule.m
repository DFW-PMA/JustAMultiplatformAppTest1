//
//  CalledObjCModule.m
//  JustAXCGLoggerWithLogonTest2
//
//  Created by JustMacApps.net on 07/29/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CalledObjCModule.h"

#import "JmObjCSwiftEnvBridge-Bridging-Header.h"

@implementation CalledObjCModule
{

//  JmObjCSwiftEnvBridge *jmObjCSwiftEnvBridge;

    JmObjCSwiftEnvBridge *_jmObjCSwiftEnvBridge;

    NSString *_internalVariable;

}

- (void)initInstance
{

    NSLog(@"--- CalledObjCModule.initInstance() - Invoked...");

    //  self.jmObjCSwiftEnvBridge = JmObjCSwiftEnvBridge.sharedObjCSwiftEnvBridge

    _jmObjCSwiftEnvBridge = JmObjCSwiftEnvBridge.sharedEnvBridge;

    NSLog(@"--- CalledObjCModule.initInstance() - Exiting - '_jmObjCSwiftEnvBridge' is [%@] ---", _jmObjCSwiftEnvBridge);

}

- (void)setObjCSwiftEnvBridge:(JmObjCSwiftEnvBridge * _Nullable)jmobjcswiftenvbridge
{

    NSLog(@"--- CalledObjCModule.setObjCSwiftEnvBridge() - Invoked - parameter 'jmobjcswiftenvbridge' is [%@] ---", jmobjcswiftenvbridge);

    _jmObjCSwiftEnvBridge = jmobjcswiftenvbridge;

    NSLog(@"--- CalledObjCModule.setObjCSwiftEnvBridge() - Exiting - '_jmObjCSwiftEnvBridge' is [%@] ---", jmobjcswiftenvbridge);

}

- (NSString * _Nullable)getInternalVariable
{

    _internalVariable = @"This is the 'internal' variable...";

    NSLog(@"--- CalledObjCModule.getInternalVariable() - Invoked - '_internalVariable' is [%@] ---", _internalVariable);
    NSLog(@"--- CalledObjCModule.getInternalVariable() - Exiting ---");

    return _internalVariable;

}

- (void)sayHello:(NSString * _Nullable)message
{

    NSLog(@"--- CalledObjCModule.sayHello() - Invoked ---");
    NSLog(@"      parameter 'message': %@", message);
    NSLog(@"--- CalledObjCModule.sayHello() - Exiting ---");

}

@end

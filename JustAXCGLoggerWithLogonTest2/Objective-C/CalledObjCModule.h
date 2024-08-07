//
//  CalledObjCModule.h
//  JustAXCGLoggerWithLogonTest2
//
//  Created by JustMacApps.net on 07/29/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JmObjCSwiftEnvBridge-Bridging-Header.h"

//@interface JmObjCSwiftEnvBridge: NSObject
//@end

@interface CalledObjCModule : NSObject
- (void)initInstance;
- (void)setObjCSwiftEnvBridge:(JmObjCSwiftEnvBridge * _Nullable)jmobjcswiftenvbridge;
- (NSString * _Nullable)getInternalVariable;
- (void)sayHello:(NSString * _Nullable)message;

// @property (nonatomic, strong) JmObjCSwiftEnvBridge * _Nullable jmObjCSwiftEnvBridge;

@end

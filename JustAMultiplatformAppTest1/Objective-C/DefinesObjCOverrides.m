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

//  - (void)initInstance
//  {
//
//      NSLogv(@"--- Defines.initInstance() - Invoked...", NULL);
//
//      _jmObjCSwiftEnvBridge = JmObjCSwiftEnvBridge.sharedEnvBridge;
//
//  //  NSLogv(@"--- Defines.initInstance() - Exiting - '_jmObjCSwiftEnvBridge' is [%@] ---", _jmObjCSwiftEnvBridge);
//
//  }
//
//  - (void)customLogger:(NSString * _Nullable)message
//  {
//
//      NSLogv(@"--- Defines.customLogger() - Invoked ---", NULL);
//  //  NSLogv(@"--- Defines.customLogger() - Parameter 'message': %@", message);
//      
//      if (_jmObjCSwiftEnvBridge) {
//  //      NSLogv(@"--- Defines.customLogger() - Test - '_jmObjCSwiftEnvBridge' is NOT Null - is [%@] ---", _jmObjCSwiftEnvBridge);
//          [_jmObjCSwiftEnvBridge jmLogMsg:message];
//      } else {
//          NSLogv(@"--- Defines.customLogger() - Test - '_jmObjCSwiftEnvBridge' is Null - Error! ---", NULL);
//      }
//
//      NSLogv(@"--- Defines.customLogger() - Exiting ---", NULL);
//
//  }

@end

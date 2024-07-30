//
//  CalledObjCModule.h
//  JustAXCGLoggerWithLogonTest2
//
//  Created by JustMacApps.net on 07/29/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalledObjCModule : NSObject

- (NSString * _Nullable)getInternalVariable;
- (void)sayHello:(NSString * _Nonnull)message;

@end

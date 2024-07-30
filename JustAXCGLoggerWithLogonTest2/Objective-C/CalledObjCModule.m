//
//  CalledObjCModule.m
//  JustAXCGLoggerWithLogonTest2
//
//  Created by JustMacApps.net on 07/29/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

#import "CalledObjCModule.h"

@implementation CalledObjCModule
{

    NSString *_internalVariable;

}

- (NSString * _Nullable)getInternalVariable
{

    _internalVariable = @"This is the 'internal' variable...";

    NSLog(@"--- CalledObjCModule.getInternalVariable() - Invoked - '_internalVariable' is [%@] ---", _internalVariable);
    NSLog(@"--- CalledObjCModule.getInternalVariable() - Exiting ---");

    return _internalVariable;

}

- (void)sayHello:(NSString * _Nonnull)message
{

    NSLog(@"--- CalledObjCModule.sayHello() - Invoked ---");
    NSLog(@"      parameter 'message': %@", message);
    NSLog(@"--- CalledObjCModule.sayHello() - Exiting ---");

}

@end

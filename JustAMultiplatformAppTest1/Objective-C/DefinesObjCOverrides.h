//
//  DefinesObjCOverrides.h
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 07/29/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefinesObjCOverrides : NSObject
- (void)initInstance;
- (void)customLoggerTest1:(NSString * _Nullable)message;
@end

//efine NSLog(...) customLoggerTest1(__VA_ARGS__);
//#define NSLog(...) \
//             ((customLoggerTest1([NSString stringWithFormat:format_string,##__VA_ARGS__])))


//
//  JmAppDelegateVisitor-Bridging-Header.h
//

#import <Foundation/Foundation.h>
#import <SwiftUI/SwiftUI.h>

// ObjC uses 'id' as Swift's 'Any'...

@interface JmAppDelegateVisitor: NSObject

- (BOOL)appDelegateVisitorWillFinishLaunchingWithOptions:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (BOOL)appDelegateVisitorDidFinishLaunchingWithOptions:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (BOOL)appDelegateVisitorWillFinishLaunchingWithOptions:(UIApplication *)application;
- (BOOL)appDelegateVisitorDidFinishLaunchingWithOptions:(UIApplication *)application;
- (void)appDelegateVisitorWillTerminate:(UIApplication *)application;

@end


//
//  JustAMultiplatformAppTest1App.swift
//  JustAMultiplatformAppTest1
//
//  Created by Daryl Cox on 07/19/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

@main
struct JustAMultiplatformAppTest1App: App 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "JustAMultiplatformAppTest1App"
        static let sClsVers      = "v1.0702"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // AppDelegate:
    //     (NOTE: This causes the AppDelegate class to instantiate
    //            - use this ONLY once in an App or it will cause multiple instantiation(s) of AppDelegate...

#if os(macOS)

    @NSApplicationDelegateAdaptor(JustAMultiplatformAppTest1NSAppDelegate.self)
    var appDelegate

#elseif os(iOS)

    @UIApplicationDelegateAdaptor(JustAMultiplatformAppTest1UIAppDelegate.self)
    var appDelegate

#endif

    // App Data field(s):

    var jmAppDelegateVisitor:JmAppDelegateVisitor = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    let sAppBundlePath:String                     = Bundle.main.bundlePath

    func xcgLogMsg(_ sMessage:String)
    {

    //  print("\(sMessage)")
        self.jmAppDelegateVisitor.xcgLogMsg(sMessage)

        // Exit:

        return

    }   // End of func xcgLogMsg().

    var body: some Scene 
    {
        
        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):body(some Scene) - 'sAppBundlePath' is [\(sAppBundlePath)]...")
        
        WindowGroup 
        {
            
            ContentView()
                .navigationTitle(AppGlobalInfo.sGlobalInfoAppId)
                .onOpenURL(perform: 
                { url in
                    
                    xcgLogMsg("\(ClassInfo.sClsDisp):ContentView.onOpenURL() performed for the URL of [\(url)]...")

                })

        }
        .handlesExternalEvents(matching: [])
        .commands 
        {

            AppInfoCommands()

            HelpCommands()

        }
        
    #if os(macOS)

        Settings
        {
      
            SettingsSingleView()
      
        }

    #endif
        
    }
    
}   // End of struct JustAMultiplatformAppTest1App(App). 


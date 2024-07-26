//
//  JustAXCGLoggerWithLogonTest2App.swift
//  JustAXCGLoggerWithLogonTest2
//
//  Created by Daryl Cox on 07/19/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

@main
struct JustAXCGLoggerWithLogonTest2App: App 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "JustAXCGLoggerWithLogonTest2App"
        static let sClsVers      = "v1.0402"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // AppDelegate:
    //     (NOTE: This causes the AppDelegate class to instantiate
    //            - use this ONLY once in an App or it will cause multiple instantiation(s) of AppDelegate...

    @NSApplicationDelegateAdaptor(JustAXCGLoggerWithLogonTest2AppDelegate.self)
    var appDelegate

    // App Data field(s):

    let sAppBundlePath:String = Bundle.main.bundlePath

    var body: some Scene 
    {
        
        let _ = xcgLogger(sMessage:"\(ClassInfo.sClsDisp):body(some Scene) - 'sAppBundlePath' is [\(sAppBundlePath)]...")
        
        WindowGroup 
        {
            
            ContentView()
                .navigationTitle(AppGlobalInfo.sGlobalInfoAppId)
                .onOpenURL(perform: 
                { url in
                    
                    xcgLogger(sMessage:"\(ClassInfo.sClsDisp):ContentView.onOpenURL() performed for the URL of [\(url)]...")

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
    
    func xcgLogger(sMessage:String)
    {

        self.appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLogger().

}


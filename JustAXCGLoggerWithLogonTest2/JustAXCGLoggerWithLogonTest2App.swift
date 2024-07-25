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
        static let sClsVers      = "v1.0306"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // App Data field(s):

    @NSApplicationDelegateAdaptor(JustAXCGLoggerWithLogonTest2AppDelegate.self)
    var appDelegate

    let sAppBundlePath:String = Bundle.main.bundlePath

    var body: some Scene 
    {
        
        let _ = xcgLogger(sMessage:"\(ClassInfo.sClsDisp):body(some Scene) - 'sAppBundlePath' is [\(sAppBundlePath)]...")
        
        WindowGroup 
        {
            
            ContentView()
                .navigationTitle(AppGlobalInfo.sGlobalInfoAppId)
            
        }
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


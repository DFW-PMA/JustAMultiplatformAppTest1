//
//  AppInfoCommands.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 05/17/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import SwiftUI

struct AppInfoCommands: Commands 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "AppInfoCommands"
        static let sClsVers      = "v1.0501"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // Do NOT use this <here> - @EnvironmentObject has NO AppDelegate (causes a CRASH).
    //     The 'var body: some Commands' is NOT in the parental Tree structure of the App (and ContentView).
    // AppDelegate (via @EnvironmentObject - automatic via the App's @NSApplicationDelegateAdaptor property wrapper

    // @EnvironmentObject private var appDelegate:JustAMultiplatformAppTest1NSAppDelegate

    var body: some Commands
    {
        
        CommandGroup(replacing: .appInfo) 
        {

            Button("About \(AppGlobalInfo.sGlobalInfoAppId)")
            {

                NSApplication.shared.orderFrontStandardAboutPanel(
                    options: [NSApplication.AboutPanelOptionKey(rawValue: "Copyright"): "\(ClassInfo.sClsCopyRight)",
                              NSApplication.AboutPanelOptionKey.credits: 
                                  NSAttributedString(string: "Log file at \((JustAMultiplatformAppTest1NSAppDelegate.ClassSingleton.appDelegate!.sAppDelegateLogFilespec ?? "-N-A-")) (Usable [\(JustAMultiplatformAppTest1NSAppDelegate.ClassSingleton.appDelegate!.bAppDelegateLogFilespecIsUsable)])",
                                                     attributes: [NSAttributedString.Key.font: NSFont.messageFont(ofSize: NSFont.smallSystemFontSize)]
                                                     ),
                             ]

                    )

            }

        }

    }
    
    func xcgLoggerMsg(sMessage:String)
    {

        let appDelegate:JustAMultiplatformAppTest1NSAppDelegate
                = JustAMultiplatformAppTest1NSAppDelegate.ClassSingleton.appDelegate!
      
        appDelegate.xcgLogger?.info("\(sMessage)")

    //  self.appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLoggerMsg().

}


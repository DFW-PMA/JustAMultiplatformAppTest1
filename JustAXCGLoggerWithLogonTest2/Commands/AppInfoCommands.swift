//
//  AppInfoCommands.swift
//  JustAXCGLoggerWithLogonTest2
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
        static let sClsVers      = "v1.0403"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    var body: some Commands
    {
        
        CommandGroup(replacing: .appInfo) 
        {

            Button("About \(AppGlobalInfo.sGlobalInfoAppId)")
            {

                NSApplication.shared.orderFrontStandardAboutPanel(
                    options: [NSApplication.AboutPanelOptionKey(rawValue: "Copyright"): "\(ClassInfo.sClsCopyRight)",
                              NSApplication.AboutPanelOptionKey.credits: 
                              //  NSAttributedString(string: "Log file is -coming-",
                                  NSAttributedString(string: "Log file at \((JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!.sAppDelegateLogFilespec ?? "-N-A-")) (Usable [\(JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!.bAppDelegateLogFilespecIsUsable)])",
                                                     attributes: [NSAttributedString.Key.font: NSFont.messageFont(ofSize: NSFont.smallSystemFontSize)]
                                                     ),
                             ]

                    )

            }

        }

    }
    
    func xcgLoggerMsg(sMessage:String)
    {

        let appDelegate:JustAXCGLoggerWithLogonTest2AppDelegate
                                   = JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!

        appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLoggerMsg().

}


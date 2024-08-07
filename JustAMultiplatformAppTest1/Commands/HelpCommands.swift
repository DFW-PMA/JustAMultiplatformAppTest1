//
//  HelpCommands.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 05/17/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import SwiftUI

struct HelpCommands: Commands 
{
    
    struct ClassInfo
    {
        
        static let sClsId          = "HelpCommands"
        static let sClsVers        = "v1.0701"
        static let sClsDisp        = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    // Do NOT use this <here> - @EnvironmentObject has NO AppDelegate (causes a CRASH).
    //     The 'var body: some Commands' is NOT in the parental Tree structure of the App (and ContentView).
    // AppDelegate (via @EnvironmentObject - automatic via the App's @NSApplicationDelegateAdaptor property wrapper

    // @EnvironmentObject private var appDelegate:JustAMultiplatformAppTest1NSAppDelegate

    var body: some Commands
    {
        
        CommandGroup(replacing: .help) 
        {

            Button(action: {xcgLoggerMsg(sMessage:"Clicked on the \(ClassInfo.sClsDisp)Help menu #1...")})
            {
      
                Text("\(ClassInfo.sClsId) 'help' #1...")
      
            }

            NavigationLink(destination: HelpBasicView(sHelpBasicContents: JustAMultiplatformAppTest1NSAppDelegate.ClassSingleton.appDelegate!.getAppDelegateHelpBasicContents()).navigationBarBackButtonHidden(true))
            {
      
                Label("\(ClassInfo.sClsId) 'Basic' HELP viewer...", systemImage: "questionmark.circle")
      
            }

            NavigationLink(destination: LogFileView().navigationBarBackButtonHidden(true))
            {
      
                Label("\(ClassInfo.sClsId) Log file viewer...", systemImage: "questionmark.circle")
      
             }

            Button(action: {clearAppDelegateTraceLogFile()})
            {

                Text("\(ClassInfo.sClsId) 'clear' Log file")

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

    func clearAppDelegateTraceLogFile()
    {

        let appDelegate:JustAMultiplatformAppTest1NSAppDelegate
                = JustAMultiplatformAppTest1NSAppDelegate.ClassSingleton.appDelegate!
      
        appDelegate.clearAppDelegateTraceLogFile()

    //  self.appDelegate.clearAppDelegateTraceLogFile()
        
        return
        
    }   // End of func clearAppDelegateTraceLogFile().
    
}


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
        static let sClsVers        = "v1.0804"
        static let sClsDisp        = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    // Do NOT use this <here> - @EnvironmentObject has NO AppDelegate (causes a CRASH).
    //     The 'var body: some Commands' is NOT in the parental Tree structure of the App (and ContentView).
    // AppDelegate (via @EnvironmentObject - automatic via the App's @NSApplicationDelegateAdaptor property wrapper

    // @EnvironmentObject private var appDelegate:JustAMultiplatformAppTest1NSAppDelegate

    // App Data field(s):

    @State private var cHelpCommandsAppLogClearButtonPresses:Int = 0

    @State private var isAppLogClearShowingAlert:Bool           = false
    
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

        //  Button(action: {clearAppDelegateTraceLogFile()})
        //  {
        //
        //      Text("\(ClassInfo.sClsId) 'clear' Log file")
        //
        //  }

            Button
            {

                self.cHelpCommandsAppLogClearButtonPresses += 1

                let _ = xcgLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):Commands(Help) in Button(Xcode).'App Log 'Clear'.#(\(self.cHelpCommandsAppLogClearButtonPresses))'...")

                self.clearAppDelegateTraceLogFile()

            //  self.isAppLogClearShowingAlert = true
            //
            //  let _ = xcgLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):Commands(Help) in Button(Xcode).'App Log 'Clear'.#(\(self.cHelpCommandsAppLogClearButtonPresses))' - 'self.isAppLogClearShowingAlert' is [\(self.isAppLogClearShowingAlert)]...")

            }
            label: 
            {

                Text("\(ClassInfo.sClsId) 'clear' Log file")

            }
        //  .alert("Alert:: App Log has been 'Cleared'...", isPresented:$isAppLogClearShowingAlert)
        //  {
        //
        //      Button("Ok", role:.cancel) { }
        //
        //  }
            .controlSize(.regular)
            .background(Color(red: 0, green: 0.5, blue: 0.5))
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)

        }

    }

    func clearAppDelegateTraceLogFile()
    {

        let appDelegate:JustAMultiplatformAppTest1NSAppDelegate
                = JustAMultiplatformAppTest1NSAppDelegate.ClassSingleton.appDelegate!
      
        appDelegate.clearAppDelegateTraceLogFile()

        appDelegate.sAppDelegateGlobalAlertButtonText = "Ok"
        appDelegate.sAppDelegateGlobalAlertMessage    = "Alert:: App Log has been 'Cleared'..."
        appDelegate.isAppDelegateShowingAlert         = true

        let _ = xcgLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):Commands(Help) in Button(Xcode).'App Log 'Clear'.#(\(self.cHelpCommandsAppLogClearButtonPresses))' - 'self.isAppLogClearShowingAlert' is [\(self.isAppLogClearShowingAlert)]...")

        return
        
    }   // End of func clearAppDelegateTraceLogFile().
    
    func xcgLoggerMsg(sMessage:String)
    {

        let appDelegate:JustAMultiplatformAppTest1NSAppDelegate
                = JustAMultiplatformAppTest1NSAppDelegate.ClassSingleton.appDelegate!
      
        appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLoggerMsg().

}   // End of struct HelpCommands(Commands).


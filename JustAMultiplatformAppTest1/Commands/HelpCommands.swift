//
//  HelpCommands.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 05/17/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

struct HelpCommands: Commands 
{
    
    struct ClassInfo
    {
        
        static let sClsId          = "HelpCommands"
        static let sClsVers        = "v1.0904"
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

    var jmAppDelegateVisitor:JmAppDelegateVisitor                = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    private func xcgLogMsg(_ sMessage:String)
    {

    //  print("\(sMessage)")
        self.jmAppDelegateVisitor.xcgLogMsg(sMessage)

        // Exit:

        return

    }   // End of private func xcgLogMsg().

    var body: some Commands
    {
        
        CommandGroup(replacing: .help) 
        {

            Button(action: {xcgLogMsg("Clicked on the \(ClassInfo.sClsDisp)Help menu #1...")})
            {
      
                Text("\(ClassInfo.sClsId) 'help' #1...")
      
            }

            NavigationLink(destination: HelpBasicView(sHelpBasicContents: jmAppDelegateVisitor.getAppDelegateVisitorHelpBasicContents()).navigationBarBackButtonHidden(true))
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

        //  Button
        //  {
        //
        //      self.cHelpCommandsAppLogClearButtonPresses += 1
        //
        //      let _ = xcgLogMsg("\(ClassInfo.sClsDisp):Commands(Help) in Button(Xcode).'App Log 'Clear'.#(\(self.cHelpCommandsAppLogClearButtonPresses))'...")
        //
        //      self.clearAppDelegateTraceLogFile()
        //
        //  }
        //  label: 
        //  {
        //
        //      Text("\(ClassInfo.sClsId) 'clear' Log file")
        //
        //  }
        //  .controlSize(.regular)
        //  .background(Color(red: 0, green: 0.5, blue: 0.5))
        //  .foregroundStyle(.white)
        //  .buttonStyle(.borderedProminent)

        }

    }

    func clearAppDelegateTraceLogFile()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")
      
        self.cHelpCommandsAppLogClearButtonPresses += 1
        
        jmAppDelegateVisitor.clearAppDelegateVisitorTraceLogFile()

        jmAppDelegateVisitor.sAppDelegateVisitorGlobalAlertButtonText = "Ok"
        jmAppDelegateVisitor.sAppDelegateVisitorGlobalAlertMessage    = "Alert:: App Log has been 'Cleared'..."
        jmAppDelegateVisitor.isAppDelegateVisitorShowingAlert         = true

        self.xcgLogMsg("\(ClassInfo.sClsDisp):Commands(Help) in Button(Xcode).'App Log 'Clear'.#(\(self.cHelpCommandsAppLogClearButtonPresses))'...")

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return
        
    }   // End of func clearAppDelegateTraceLogFile().
    
}   // End of struct HelpCommands(Commands).


//
//  HelpCommands.swift
//  JustAXCGLoggerWithLogonTest2
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
        static let sClsVers        = "v1.0604"
        static let sClsDisp        = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    var body: some Commands
    {
        
    //  CommandMenu("AppHelp") 
        CommandGroup(replacing: .help) 
        {

            Button(action: {xcgLoggerMsg(sMessage:"Clicked on the \(ClassInfo.sClsDisp)Help menu #1...")})
            {
      
                Text("\(ClassInfo.sClsId) 'help' #1...")
      
            }

        //  NavigationLink(destination: HelpBasicView(sHelpBasicContents: "\(ClassInfo.sClsDisp) - 'basic' HELP Placeholder ---").navigationBarBackButtonHidden(true))
            NavigationLink(destination: HelpBasicView(sHelpBasicContents: JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!.getAppDelegateHelpBasicContents()).navigationBarBackButtonHidden(true))
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

        let appDelegate:JustAXCGLoggerWithLogonTest2AppDelegate
                = JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!

        appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLoggerMsg().

    func clearAppDelegateTraceLogFile()
    {

        let appDelegate:JustAXCGLoggerWithLogonTest2AppDelegate
                = JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!


        appDelegate.clearAppDelegateTraceLogFile()
        
        return
        
    }   // End of func clearAppDelegateTraceLogFile().
    
}


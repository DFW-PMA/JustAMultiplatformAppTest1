//
//  LogFileView.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 03/20/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import Foundation
import SwiftUI
import QuickLook

struct LogFileView: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId          = "LogFileView"
        static let sClsVers        = "v1.0601"
        static let sClsDisp        = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    // AppDelegate (via @EnvironmentObject - automatic via the App's @NSApplicationDelegateAdaptor property wrapper

    @EnvironmentObject private var appDelegate:JustAMultiplatformAppTest1NSAppDelegate

    // App Data field(s):

    @State private var cLogFileViewAppLogClearButtonPresses:Int = 0

    @State private var isAppLogClearShowingAlert:Bool           = false
    
    @State  var logFileUrl:URL?
    
    private let pasteboard = NSPasteboard.general
    
    private var sLogFileText:String
    {
        
        JmFileIO.readFile(sFilespec: self.appDelegate.sAppDelegateLogFilespec!) ?? "--- empty LOG file ---"
        
    }

    var body: some View 
    {
        
        VStack
        {

            Spacer()

            Text("Log file:")
                .font(.callout)
                .contextMenu
                {
                
                    Button
                    {
                        
                        let _ = xcgLoggerMsg(sMessage:"...\(ClassInfo.sClsDisp):ContentView in Text.contextMenu.'copy' button #1...")
                        
                        copyLogFilespecToClipboard()
                        
                    }
                    label:
                    {
                        
                        Text("Copy to Clipboard")
                        
                    }
                
                }

            Text("")

            Text(self.appDelegate.sAppDelegateLogFilespec ?? "...empty...")
                .contextMenu
                {
                
                    Button
                    {
                        
                        let _ = xcgLoggerMsg(sMessage:"...\(ClassInfo.sClsDisp):ContentView in Text.contextMenu.'copy' button #2...")
                        
                        copyLogFilespecToClipboard()
                        
                    }
                    label:
                    {
                        
                        Text("Copy to Clipboard")
                        
                    }
                
                }

            Spacer()

            Button("Preview Log file") 
            {

                self.logFileUrl = self.appDelegate.urlAppDelegateLogFilespec

                xcgLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):LogFileView.Button('Preview Log file') performed for the URL of [\(String(describing: self.logFileUrl))]...")

                

            }
            .quickLookPreview($logFileUrl)
            .controlSize(.regular)
            .background(Color(red: 0, green: 0.5, blue: 0.5))
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)

            Spacer()

            Button
            {

                self.cLogFileViewAppLogClearButtonPresses += 1

                let _ = xcgLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):LogFileView in Button(Xcode).'App Log 'Clear'.#(\(self.cLogFileViewAppLogClearButtonPresses))'...")

                self.appDelegate.clearAppDelegateTraceLogFile()

                self.isAppLogClearShowingAlert = true

            }
            label: 
            {

                Text("App Log 'Clear'")

            }
            .alert("App Log has been 'Cleared'...", isPresented:$isAppLogClearShowingAlert)
            {

                Button("Ok", role:.cancel) { }

            }
            .controlSize(.regular)
            .background(Color(red: 0, green: 0.5, blue: 0.5))
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)

            Spacer()

        }
        
    }
    
    func xcgLoggerMsg(sMessage:String)
    {

        self.appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLoggerMsg().

    func copyLogFilespecToClipboard()
    {
        
        xcgLoggerMsg(sMessage:"...\(ClassInfo.sClsDisp):ContentView in ContextMenu.copyLogFilespecToClipboard() for text of [\(JustAMultiplatformAppTest1NSAppDelegate.ClassSingleton.appDelegate!.sAppDelegateLogFilespec!)]...")
        
        pasteboard.prepareForNewContents()
        pasteboard.setString(JustAMultiplatformAppTest1NSAppDelegate.ClassSingleton.appDelegate!.sAppDelegateLogFilespec!, forType: .string)
        
        return
        
    }
    
}

#Preview 
{
    
    LogFileView()
    
}


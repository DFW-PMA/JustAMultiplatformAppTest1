//
//  LogFileView.swift
//  JustAXCGLoggerWithLogonTest2
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
        static let sClsVers        = "v1.0403"
        static let sClsDisp        = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    // App Data field(s):

    @State  var logFileUrl:URL?
    
    private let pasteboard = NSPasteboard.general
    
    private var sLogFileText:String
    {
        
        JmFileIO.readFile(sFilespec: JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!.sAppDelegateLogFilespec!) ?? "--- empty LOG file ---"
        
    }

    var body: some View 
    {
        
        VStack
        {

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

            Text(JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!.sAppDelegateLogFilespec ?? "...empty...")
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

            Button("Preview Log file") 
            {

                self.logFileUrl = JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!.urlAppDelegateLogFilespec

                xcgLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):LogFileView.Button('Preview Log file') performed for the URL of [\(String(describing: self.logFileUrl))]...")

                

            }
            .quickLookPreview($logFileUrl)

        }
        
    }
    
    func xcgLoggerMsg(sMessage:String)
    {

        let appDelegate:JustAXCGLoggerWithLogonTest2AppDelegate
                = JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!

        appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLoggerMsg().

    func copyLogFilespecToClipboard()
    {
        
    //  let _ = xcgLoggerMsg(sMessage:"...\(ClassInfo.sClsDisp):ContentView in ContextMenu.copyLogFilespecToClipboard() for text of [\(JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!.sAppDelegateLogFilespec!)]...")
        xcgLoggerMsg(sMessage:"...\(ClassInfo.sClsDisp):ContentView in ContextMenu.copyLogFilespecToClipboard() for text of [\(JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!.sAppDelegateLogFilespec!)]...")
        
        pasteboard.prepareForNewContents()
        pasteboard.setString(JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!.sAppDelegateLogFilespec!, forType: .string)
        
        return
        
    }
    
}

#Preview 
{
    
    LogFileView()
    
}


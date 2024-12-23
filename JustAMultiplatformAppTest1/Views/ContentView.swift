//
//  ContentView.swift
//  JustAMultiplatformAppTest1
//
//  Created by Daryl Cox on 07/19/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

#if os(iOS)
import UIKit
#endif

#if canImport(TipKit)
import TipKit
#endif

struct ContentView: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "ContentView"
        static let sClsVers      = "v1.1901"
        static let sClsDisp      = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    @Environment(\.openURL) var openURL

    // App Data field(s):

#if os(iOS)

    @State private var cAppViewSuspendButtonPresses:Int         = 0
    @State private var cAppViewSettingsButtonPresses:Int        = 0
    
    @State private var isAppSuspendShowing:Bool                 = false
    @State private var isAppSettingsModal:Bool                  = false

#endif

           private var bIsAppUploadUsingLongMsg:Bool            = true

    @State private var isAppExecutionCurrentShowing:Bool        = false
           private var sAppExecutionCurrentButtonText:String    = "Share the current App Log with Developers..."
           private var sAppExecutionCurrentAlertText:String     = "Do you want to 'send' the current App LOG data to the Developers?"

           private var bWasAppLogFilePresentAtStartup:Bool      = false
           private var bDidAppCrash:Bool                        = false
           private var sAppExecutionPreviousTypeText:String     = "-N/A-"
           private var sAppExecutionPreviousButtonText:String   = "App::-N/A-"
           private var sAppExecutionPreviousAlertText:String    = "Do you want to 'send' the App LOG data?"
           private var sAppExecutionPreviousLogToUpload:String  = ""
    @State private var isAppExecutionPreviousShowing:Bool       = false

    @State private var cContentViewRefreshButtonPresses:Int     = 0

    @State private var shouldContentViewChange:Bool              = false
    @State private var shouldContentViewShowAlert:Bool          = false
    
    var jmAppDelegateVisitor:JmAppDelegateVisitor               = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    init()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Get some 'internal' Dev Detail(s)...

        bWasAppLogFilePresentAtStartup = checkIfAppLogWasPresent()
        bDidAppCrash                   = checkIfAppDidCrash()

        if (bDidAppCrash == false)
        {

            sAppExecutionPreviousTypeText    = "Success"
            sAppExecutionPreviousButtonText  = "Share the App 'success' Log with Developers..."
            sAppExecutionPreviousAlertText   = "Do you want to 'send' the App execution 'success' LOG data to the Developers?"
            sAppExecutionPreviousLogToUpload = AppGlobalInfo.sGlobalInfoAppLastGoodLogFilespec

        }
        else
        {

            sAppExecutionPreviousTypeText    = "Crash"
            sAppExecutionPreviousButtonText  = "Share the App CRASH Log with Developers..."
            sAppExecutionPreviousAlertText   = "Do you want to 'send' the App execution 'crash' LOG data to the Developers?"
            sAppExecutionPreviousLogToUpload = AppGlobalInfo.sGlobalInfoAppLastCrashLogFilespec

        }

        // Exit...

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'bDidAppCrash' is [\(bDidAppCrash)]...")

        return

    }   // End of init().

    private func xcgLogMsg(_ sMessage:String)
    {

        if (self.jmAppDelegateVisitor.bAppDelegateVisitorLogFilespecIsUsable == true)
        {
        
            self.jmAppDelegateVisitor.xcgLogMsg(sMessage)
        
        }
        else
        {
        
            print("\(sMessage)")
        
        }

        // Exit:

        return

    }   // End of private func xcgLogMsg().

    var body: some View 
    {

        let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp):body(some Scene) \(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)...")
        
        VStack 
        {
            
        #if os(iOS)

            HStack
            {

                Button
                {

                    self.cAppViewSuspendButtonPresses += 1

                    let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'Quit'.#(\(self.cAppViewSuspendButtonPresses))...")

                    self.isAppSuspendShowing.toggle()

                }
                label:
                {

                    VStack(alignment:.center)
                    {

                        Label("", systemImage: "xmark.circle")
                            .help(Text("Suspend this App"))
                            .imageScale(.large)

                        Text("Suspend App")
                            .font(.caption)

                    }

                }
                .alert("Are you sure you want to 'suspend' this App?", isPresented:$isAppSuspendShowing)
                {
                    Button("Cancel", role:.cancel)
                    {
                        let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Cancel' to 'suspend' the App - resuming...")
                    }
                    Button("Ok", role:.destructive)
                    {
                        let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Ok' to 'suspend' the App - suspending...")

                        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
                    }
                }

                Spacer()

                if (bWasAppLogFilePresentAtStartup == true)
                {

                    Button
                    {

                        let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp)ContentViewClock in Button(Xcode).'\(sAppExecutionPreviousButtonText)'...")

                        self.isAppExecutionPreviousShowing.toggle()

                    }
                    label:
                    {
                        
                        VStack(alignment:.center)
                        {
                            
                            Label("", systemImage: "arrow.up.message")
                                .help(Text("'Send' \(sAppExecutionPreviousTypeText) App LOG"))
                                .imageScale(.large)
                            
                            Text("\(sAppExecutionPreviousTypeText) LOG")
                                .font(.caption)
                            
                        }
                        
                    }
                    .alert(sAppExecutionPreviousAlertText, isPresented:$isAppExecutionPreviousShowing)
                    {
                        Button("Cancel", role:.cancel)
                        {
                            let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Cancel' to 'send' the \(sAppExecutionPreviousTypeText) App LOG - resuming...")
                        }
                        Button("Ok", role:.destructive)
                        {
                            let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Ok' to 'send' the \(sAppExecutionPreviousTypeText) App LOG - sending...")

                            self.uploadPreviousAppLogToDevs()
                        }
                    }

                }

                Spacer()

                if (jmAppDelegateVisitor.bAppDelegateVisitorLogFilespecIsUsable == true)
                {

                    Button
                    {

                        let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'\(sAppExecutionCurrentButtonText)'...")

                        self.isAppExecutionCurrentShowing.toggle()

                    }
                //  Button("Tap to \(sAppExecutionCurrentButtonText)")
                    label:
                    {
                        
                        VStack(alignment:.center)
                        {
                            
                            Label("", systemImage: "arrow.up.message")
                                .help(Text("'Send' current App LOG"))
                                .imageScale(.large)
                            
                            Text("Current LOG")
                                .font(.caption)
                            
                        }
                        
                    }
                    .alert(sAppExecutionCurrentAlertText, isPresented:$isAppExecutionCurrentShowing)
                    {
                        Button("Cancel", role:.cancel)
                        {
                            let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Cancel' to 'send' the current App LOG - resuming...")
                        }
                        Button("Ok", role:.destructive)
                        {
                            let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Ok' to 'send' the current App LOG - sending...")

                            self.uploadCurrentAppLogToDevs()
                        }
                    }

                    Spacer()

                }

                Button
                {

                    self.cAppViewSettingsButtonPresses += 1

                    let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'Settings'.#(\(self.cAppViewSettingsButtonPresses))...")

                    self.isAppSettingsModal.toggle()

                }
                label:
                {

                    VStack(alignment:.center)
                    {

                        Label("", systemImage: "gearshape")
                            .help(Text("App Settings"))
                            .imageScale(.large)

                        Text("Settings")
                            .font(.caption)

                    }

                }
                .fullScreenCover(isPresented:$isAppSettingsModal)
                {

                    SettingsSingleView()

                }

            }

        #endif
            
            Spacer(minLength:10)

        if #available(iOS 17.0, *)
        {

            Image(ImageResource(name: "Gfx/AppIcon", bundle: Bundle.main))
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal)
                    { size, axis in
                        size * 0.15
                    }

        }
        else
        {

            Image(ImageResource(name: "Gfx/AppIcon", bundle: Bundle.main))
                .resizable()
                .scaledToFit()
                .frame(width:75, height: 75, alignment:.center)

        }
            
            Spacer(minLength: 10)
            
            Text("--- [\(AppGlobalInfo.sGlobalInfoAppId)] ---")
                .onReceive(jmAppDelegateVisitor.$isAppDelegateVisitorShowingAlert,
                    perform:
                    { bShow in
                        if (bShow == true)
                        {
                            let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp).onReceive #1 - Received a 'show' Alert...")
                            shouldContentViewShowAlert                            = true
                            jmAppDelegateVisitor.isAppDelegateVisitorShowingAlert = false
                        }
                    })
                .alert("\(jmAppDelegateVisitor.sAppDelegateVisitorGlobalAlertMessage ?? "")", isPresented:$shouldContentViewShowAlert)
                {

                    Button("\(jmAppDelegateVisitor.sAppDelegateVisitorGlobalAlertButtonText ?? "")", role:.cancel) { }

                }
            
            Spacer()
            
        //  if (bWasAppLogFilePresentAtStartup == true)
        //  {
        //
        //      Button("Tap to \(sAppExecutionPreviousButtonText)")
        //      {
        //
        //          let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'\(sAppExecutionPreviousButtonText)'...")
        //
        //          self.isAppExecutionPreviousShowing.toggle()
        //
        //      }
        //      .alert(sAppExecutionPreviousAlertText, isPresented:$isAppExecutionPreviousShowing)
        //      {
        //          Button("Cancel", role:.cancel)
        //          {
        //              let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Cancel' to 'send' the App LOG - resuming...")
        //          }
        //          Button("Ok", role:.destructive)
        //          {
        //              let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Ok' to 'send' the App LOG - sending...")
        //
        //              self.uploadPreviousAppLogToDevs()
        //
        //          }
        //      }
        //      .controlSize(.regular)
        //      .background(Color(red: 0, green: 0.5, blue: 0.5))
        //      .foregroundStyle(.white)
        //      .buttonStyle(.borderedProminent)
        //
        //  }
        //      
        //  Spacer()
            
            Text("\(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)")     // <=== Version...
                .italic()
                .onReceive(jmAppDelegateVisitor.$appDelegateVisitorSwiftViewsShouldChange,
                    perform:
                    { bChange in
                        if (bChange == true)
                        {
                            let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp).onReceive #2 - Received a 'view(s)' SHOULD Change...")

                            shouldContentViewChange = true

                            jmAppDelegateVisitor.resetAppDelegateVisitorSignalSwiftViewsShouldChange()
                        }
                    })

            Spacer(minLength: 4)

            Text("\(JmXcodeBuildSettings.jmAppCopyright)")
                .italic()
            
            Spacer()
            
        //  Button("Refresh - #(\(self.cContentViewRefreshButtonPresses))...")
            Button
            {
                
                self.cContentViewRefreshButtonPresses += 1
                
                let _ = self.xcgLogMsg("...\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'Refresh'.#(\(self.cContentViewRefreshButtonPresses))...")

            }
            label:
            {

                VStack(alignment:.center)
                {

                    Label("", systemImage: "arrow.clockwise")
                        .help(Text("'Refresh' App Screen..."))
                        .imageScale(.large)

                    Text("Refresh - #(\(self.cContentViewRefreshButtonPresses))...")
                        .font(.caption)

                }

            }
        //  .controlSize(.regular)
        //  .background(Color(red: 0, green: 0.5, blue: 0.5))
        //  .foregroundStyle(.white)
        //  .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }
        .padding()
        .task 
        {

            // Configure and load your tips at app launch...

            do
            {

                try Tips.configure([.displayFrequency(.immediate), .datastoreLocation(.applicationDefault)])

            } 
            catch 
            {

                // Handle TipKit errors

                let _ = self.xcgLogMsg("...\(ClassInfo.sClsDisp)ContentView - Failed to initialize the TipKit framework - Detail(s) are [\(error.localizedDescription)] - Error!")

            }

        }
        
    }

    func checkIfAppLogWasPresent() -> Bool
    {
  
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")
  
        self.xcgLogMsg("\(sCurrMethodDisp) 'jmAppDelegateVisitor' is [\(String(describing: jmAppDelegateVisitor))] - details are [\(jmAppDelegateVisitor.toString())]...")
  
        let bWasAppLogPresentAtStart:Bool = jmAppDelegateVisitor.bWasAppLogFilePresentAtStartup
        
        // Exit...
  
        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'bWasAppLogPresentAtStart' is [\(String(describing: bWasAppLogPresentAtStart))]...")
  
        return bWasAppLogPresentAtStart
  
    }   // End of checkIfAppLogWasPresent().

    func checkIfAppDidCrash() -> Bool
    {
  
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")
  
        self.xcgLogMsg("\(sCurrMethodDisp) 'jmAppDelegateVisitor' is [\(String(describing: jmAppDelegateVisitor))] - details are [\(jmAppDelegateVisitor.toString())]...")
  
        let bDidAppCrashOnLastRun:Bool = jmAppDelegateVisitor.bWasAppCrashFilePresentAtStartup
  
        self.xcgLogMsg("\(sCurrMethodDisp) 'bDidAppCrashOnLastRun' is [\(String(describing: bDidAppCrashOnLastRun))]...")
        
        // Exit...
  
        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'bDidAppCrashOnLastRun' is [\(String(describing: bDidAppCrashOnLastRun))]...")
  
        return bDidAppCrashOnLastRun
  
    }   // End of checkIfAppDidCrash().

    func uploadCurrentAppLogToDevs()
    {
  
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Prepare specifics to 'upload' the AppLog file...

        var urlAppDelegateVisitorLogFilepath:URL?     = nil
        var urlAppDelegateVisitorLogFilespec:URL?     = nil
        var sAppDelegateVisitorLogFilespec:String!    = nil
        var sAppDelegateVisitorLogFilepath:String!    = nil
        var sAppDelegateVisitorLogFilenameExt:String! = nil

        do 
        {

            urlAppDelegateVisitorLogFilepath  = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask ,appropriateFor: nil, create: true)
            urlAppDelegateVisitorLogFilespec  = urlAppDelegateVisitorLogFilepath?.appendingPathComponent(AppGlobalInfo.sGlobalInfoAppLogFilespec)
            sAppDelegateVisitorLogFilespec    = urlAppDelegateVisitorLogFilespec?.path
            sAppDelegateVisitorLogFilepath    = urlAppDelegateVisitorLogFilepath?.path
            sAppDelegateVisitorLogFilenameExt = urlAppDelegateVisitorLogFilespec?.lastPathComponent

            self.xcgLogMsg("[\(sCurrMethodDisp)] 'sAppDelegateVisitorLogFilespec'    (computed) is [\(String(describing: sAppDelegateVisitorLogFilespec))]...")
            self.xcgLogMsg("[\(sCurrMethodDisp)] 'sAppDelegateVisitorLogFilepath'    (resolved #2) is [\(String(describing: sAppDelegateVisitorLogFilepath))]...")
            self.xcgLogMsg("[\(sCurrMethodDisp)] 'sAppDelegateVisitorLogFilenameExt' (computed) is [\(String(describing: sAppDelegateVisitorLogFilenameExt))]...")

        }
        catch
        {

            self.xcgLogMsg("[\(sCurrMethodDisp)] Failed to 'stat' item(s) in the 'path' of [.documentDirectory] - Error: \(error)...")

        }

        // Create the AppLog's 'multipartRequestInfo' object (but WITHOUT any Data (yet))...

        let multipartRequestInfo:MultipartRequestInfo = MultipartRequestInfo()

        multipartRequestInfo.bAppZipSourceToUpload    = false
        multipartRequestInfo.sAppUploadURL            = ""          // "" takes the Upload URL 'default'...
        multipartRequestInfo.sAppUploadNotifyTo       = ""          // This is email notification - "" defaults to all Dev(s)...
        multipartRequestInfo.sAppUploadNotifyCc       = ""          // This is email notification - "" defaults to 'none'...
        multipartRequestInfo.sAppSourceFilespec       = sAppDelegateVisitorLogFilespec
        multipartRequestInfo.sAppSourceFilename       = sAppDelegateVisitorLogFilenameExt
        multipartRequestInfo.sAppZipFilename          = sAppDelegateVisitorLogFilenameExt
        multipartRequestInfo.sAppSaveAsFilename       = sAppDelegateVisitorLogFilenameExt
        multipartRequestInfo.sAppFileMimeType         = "text/plain"

        // Create the AppLog's 'multipartRequestInfo.dataAppFile' object...

        multipartRequestInfo.dataAppFile              = FileManager.default.contents(atPath: sAppDelegateVisitorLogFilespec)

        self.xcgLogMsg("\(sCurrMethodDisp) The 'upload' is using 'multipartRequestInfo' of [\(String(describing: multipartRequestInfo.toString()))]...")

        // Send the AppLog as an 'upload' to the Server...

        let multipartRequestDriver:MultipartRequestDriver = MultipartRequestDriver(bGenerateResponseLongMsg:self.bIsAppUploadUsingLongMsg)

        self.xcgLogMsg("\(sCurrMethodDisp) Calling 'multipartRequestDriver.executeMultipartRequest(multipartRequestInfo:)'...")

        multipartRequestDriver.executeMultipartRequest(multipartRequestInfo:multipartRequestInfo)
        
        self.xcgLogMsg("\(sCurrMethodDisp) Called  'multipartRequestDriver.executeMultipartRequest(multipartRequestInfo:)'...")

        // Exit...
  
        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")
  
        return
  
    }   // End of uploadCurrentAppLogToDevs().

    func uploadPreviousAppLogToDevs()
    {
  
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Prepare specifics to 'upload' the AppLog file...

        var urlAppDelegateVisitorLogFilepath:URL?     = nil
        var urlAppDelegateVisitorLogFilespec:URL?     = nil
        var sAppDelegateVisitorLogFilespec:String!    = nil
        var sAppDelegateVisitorLogFilepath:String!    = nil
        var sAppDelegateVisitorLogFilenameExt:String! = nil

        do 
        {

            urlAppDelegateVisitorLogFilepath  = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask ,appropriateFor: nil, create: true)
            urlAppDelegateVisitorLogFilespec  = urlAppDelegateVisitorLogFilepath?.appendingPathComponent(sAppExecutionPreviousLogToUpload)
            sAppDelegateVisitorLogFilespec    = urlAppDelegateVisitorLogFilespec?.path
            sAppDelegateVisitorLogFilepath    = urlAppDelegateVisitorLogFilepath?.path
            sAppDelegateVisitorLogFilenameExt = urlAppDelegateVisitorLogFilespec?.lastPathComponent

            self.xcgLogMsg("[\(sCurrMethodDisp)] 'sAppDelegateVisitorLogFilespec'    (computed) is [\(String(describing: sAppDelegateVisitorLogFilespec))]...")
            self.xcgLogMsg("[\(sCurrMethodDisp)] 'sAppDelegateVisitorLogFilepath'    (resolved #2) is [\(String(describing: sAppDelegateVisitorLogFilepath))]...")
            self.xcgLogMsg("[\(sCurrMethodDisp)] 'sAppDelegateVisitorLogFilenameExt' (computed) is [\(String(describing: sAppDelegateVisitorLogFilenameExt))]...")

        }
        catch
        {

            self.xcgLogMsg("[\(sCurrMethodDisp)] Failed to 'stat' item(s) in the 'path' of [.documentDirectory] - Error: \(error)...")

        }

        // Create the AppLog's 'multipartRequestInfo' object (but WITHOUT any Data (yet))...

        let multipartRequestInfo:MultipartRequestInfo = MultipartRequestInfo()

        multipartRequestInfo.bAppZipSourceToUpload    = false
        multipartRequestInfo.sAppUploadURL            = ""          // "" takes the Upload URL 'default'...
        multipartRequestInfo.sAppUploadNotifyTo       = ""          // This is email notification - "" defaults to all Dev(s)...
        multipartRequestInfo.sAppUploadNotifyCc       = ""          // This is email notification - "" defaults to 'none'...
        multipartRequestInfo.sAppSourceFilespec       = sAppDelegateVisitorLogFilespec
        multipartRequestInfo.sAppSourceFilename       = sAppDelegateVisitorLogFilenameExt
        multipartRequestInfo.sAppZipFilename          = sAppDelegateVisitorLogFilenameExt
        multipartRequestInfo.sAppSaveAsFilename       = sAppDelegateVisitorLogFilenameExt
        multipartRequestInfo.sAppFileMimeType         = "text/plain"

        // Create the AppLog's 'multipartRequestInfo.dataAppFile' object...

        multipartRequestInfo.dataAppFile              = FileManager.default.contents(atPath: sAppDelegateVisitorLogFilespec)

        self.xcgLogMsg("\(sCurrMethodDisp) The 'upload' is using 'multipartRequestInfo' of [\(String(describing: multipartRequestInfo.toString()))]...")

        // Send the AppLog as an 'upload' to the Server...

        let multipartRequestDriver:MultipartRequestDriver = MultipartRequestDriver(bGenerateResponseLongMsg:self.bIsAppUploadUsingLongMsg)

        self.xcgLogMsg("\(sCurrMethodDisp) Calling 'multipartRequestDriver.executeMultipartRequest(multipartRequestInfo:)'...")

        multipartRequestDriver.executeMultipartRequest(multipartRequestInfo:multipartRequestInfo)
        
        self.xcgLogMsg("\(sCurrMethodDisp) Called  'multipartRequestDriver.executeMultipartRequest(multipartRequestInfo:)'...")

        // Exit...
  
        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")
  
        return
  
    }   // End of uploadPreviousAppLogToDevs().

}

#Preview 
{
    
    ContentView()
    
}


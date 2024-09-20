//
//  ContentView.swift
//  JustAMultiplatformAppTest1
//
//  Created by Daryl Cox on 07/19/24.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

#if os(iOS)
import UIKit
#endif

struct ContentView: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "ContentView"
        static let sClsVers      = "v1.1201"
        static let sClsDisp      = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    @Environment(\.openURL) var openURL

    // App Data field(s):

#if os(iOS)

    @State private var cAppViewSuspendButtonPresses:Int     = 0
    @State private var cAppViewSettingsButtonPresses:Int    = 0
    
    @State private var isAppSuspendShowing:Bool             = false
    @State private var isAppSettingsModal:Bool              = false

#endif

                   var bDidAppCrash:Bool                    = false
           private var sAppExecutionButtonText:String       = "App::-N/A-"
           private var sAppExecutionAlertText:String        = "Do you want to 'send' the App LOG data?"
           private var sAppExecutionLogToUpload:String      = ""
    @State private var isAppExecutionShowing:Bool           = false

    @State private var cContentViewRefreshButtonPresses:Int = 0

    @State private var shouldContentViewShowAlert:Bool      = false
    
    var jmAppDelegateVisitor:JmAppDelegateVisitor           = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    init()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        bDidAppCrash = checkIfAppDidCrash()

        if (bDidAppCrash == false)
        {

            sAppExecutionButtonText  = "Share the App 'success' Log with Developers..."
            sAppExecutionAlertText   = "Do you want to 'send' the App execution 'success' LOG data to the Developers?"
            sAppExecutionLogToUpload = AppGlobalInfo.sGlobalInfoAppLastGoodLogFilespec

        }
        else
        {

            sAppExecutionButtonText  = "Share the App CRASH Log with Developers..."
            sAppExecutionAlertText   = "Do you want to 'send' the App execution 'crash' LOG data to the Developers?"
            sAppExecutionLogToUpload = AppGlobalInfo.sGlobalInfoAppLastCrashLogFilespec

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

        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):body(some Scene) \(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)...")
        
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

                    Label("", systemImage: "xmark.circle")
                        .padding()
                        .imageScale(.large)

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

                Button
                {

                    self.cAppViewSettingsButtonPresses += 1

                    let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'Settings'.#(\(self.cAppViewSettingsButtonPresses))...")

                    self.isAppSettingsModal.toggle()

                }
                label: 
                {

                    Label("", systemImage: "gearshape")
                        .padding()
                        .imageScale(.large)

                }
            //  .sheet(isPresented:$isAppSettingsModal, content:
            //      {
            //
            //          SettingsSingleView()
            //
            //      }
            //  )
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
                            shouldContentViewShowAlert                            = true
                            jmAppDelegateVisitor.isAppDelegateVisitorShowingAlert = false
                        }
                    })
                .alert("\(jmAppDelegateVisitor.sAppDelegateVisitorGlobalAlertMessage ?? "")", isPresented:$shouldContentViewShowAlert)
                {

                    Button("\(jmAppDelegateVisitor.sAppDelegateVisitorGlobalAlertButtonText ?? "")", role:.cancel) { }

                }
            
            Spacer()
            
        //  if #available(iOS 16.0, *)
        //  {
        //      
        //      ShareLink(item:    jmAppDelegateVisitor.urlAppDelegateVisitorLogToSaveFilespec!,
        //                subject: Text(sAppExecutionButtonText),
        //                message: Text("The App LOG is attached...")
        //               )
        //      {
        //          Label("Tap to \(sAppExecutionButtonText)", systemImage:"square.and.arrow.up")
        //      }
        //
        //  }
        //  else
        //  {
        //      
        //      Button("Tap to \(sAppExecutionButtonText)")
        //      {
        //          
        //          let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'\(sAppExecutionButtonText)'...")
        //
        //          self.isAppExecutionShowing.toggle()
        //
        //      }
        //      .alert(sAppExecutionAlertText, isPresented:$isAppExecutionShowing)
        //      {
        //          Button("Cancel", role:.cancel)
        //          {
        //              let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Cancel' to 'send' the App LOG - resuming...")
        //          }
        //          Button("Ok", role:.destructive)
        //          {
        //              let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Ok' to 'send' the App LOG - sending...")
        //
        //              let emailToDevs = DeveloperSupportEmail(sEmailSubject:sAppExecutionButtonText)
        //
        //              emailToDevs.sendEmailToDevelopersViaURL(openURL:openURL)
        //          }
        //      }
        //      .controlSize(.regular)
        //      .background(Color(red: 0, green: 0.5, blue: 0.5))
        //      .foregroundStyle(.white)
        //      .buttonStyle(.borderedProminent)
        //
        //  }

            Button("Tap to \(sAppExecutionButtonText)")
            {

                let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'\(sAppExecutionButtonText)'...")

                self.isAppExecutionShowing.toggle()

            }
            .alert(sAppExecutionAlertText, isPresented:$isAppExecutionShowing)
            {
                Button("Cancel", role:.cancel)
                {
                    let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Cancel' to 'send' the App LOG - resuming...")
                }
                Button("Ok", role:.destructive)
                {
                    let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Ok' to 'send' the App LOG - sending...")

                    self.uploadAppLogToDevs()

                }
            }
            .controlSize(.regular)
            .background(Color(red: 0, green: 0.5, blue: 0.5))
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)
                
            Spacer()
            
            Text("\(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)")     // <=== Version...
                .italic()

            Spacer(minLength: 4)

            Text("\(JmXcodeBuildSettings.jmAppCopyright)")
                .italic()
            
            Spacer()
            
            Button("Refresh - #(\(self.cContentViewRefreshButtonPresses))...")
            {
                
                self.cContentViewRefreshButtonPresses += 1
                
                let _ = xcgLogMsg("...\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'Refresh'.#(\(self.cContentViewRefreshButtonPresses))...")

            }
            .controlSize(.regular)
            .background(Color(red: 0, green: 0.5, blue: 0.5))
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }
        .padding()
        
    }

    func checkIfAppDidCrash() -> Bool
    {
  
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")
  
        self.xcgLogMsg("\(sCurrMethodDisp) 'jmAppDelegateVisitor' is [\(String(describing: jmAppDelegateVisitor))] - details are [\(jmAppDelegateVisitor.toString())]...")
  
        let bDidAppCrashOnLastRun:Bool = jmAppDelegateVisitor.bWasAppCrashFilePresentAtStartup
  
        self.xcgLogMsg("\(sCurrMethodDisp) 'bDidAppCrashOnLastRun' is [\(String(describing: bDidAppCrashOnLastRun))]...")
        
        // Exit...
  
        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'bDidAppCrashOnLastRun' is [\(bDidAppCrashOnLastRun)]...")
  
        return bDidAppCrashOnLastRun
  
    }   // End of checkIfAppDidCrash().

    func uploadAppLogToDevs()
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
            urlAppDelegateVisitorLogFilespec  = urlAppDelegateVisitorLogFilepath?.appendingPathComponent(sAppExecutionLogToUpload)
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
        multipartRequestInfo.sAppZipFilename          = "-N/A-"
        multipartRequestInfo.sAppSaveAsFilename       = sAppDelegateVisitorLogFilenameExt
        multipartRequestInfo.sAppFileMimeType         = "text/plain"

        // Create the AppLog's 'multipartRequestInfo.dataAppFile' object...

        multipartRequestInfo.dataAppFile              = FileManager.default.contents(atPath: sAppDelegateVisitorLogFilespec)

        self.xcgLogMsg("\(sCurrMethodDisp) The 'upload' is using 'multipartRequestInfo' of [\(String(describing: multipartRequestInfo.toString()))]...")

        // Send the AppLog as an 'upload' to the Server...

        let multipartRequestDriver:MultipartRequestDriver = MultipartRequestDriver()

        self.xcgLogMsg("\(sCurrMethodDisp) Calling 'multipartRequestDriver.executeMultipartRequest(multipartRequestInfo:)'...")

        multipartRequestDriver.executeMultipartRequest(multipartRequestInfo:multipartRequestInfo)
        
        self.xcgLogMsg("\(sCurrMethodDisp) Called  'multipartRequestDriver.executeMultipartRequest(multipartRequestInfo:)'...")

        // Exit...
  
        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")
  
        return
  
    }   // End of uploadAppLogToDevs().

}

#Preview 
{
    
    ContentView()
    
}

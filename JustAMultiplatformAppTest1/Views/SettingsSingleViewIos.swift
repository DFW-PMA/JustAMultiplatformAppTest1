//
//  SettingsSingleViewIos.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 03/26/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

#if canImport(TipKit)
import TipKit
#endif

@available(iOS 16.0, *)
struct SettingsSingleViewIos: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "SettingsSingleViewIos"
        static let sClsVers      = "v1.0405"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }
    
    // App Data field(s):
    
//  @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
           private var appAboutTip                              = AppAboutTip()

    @State private var cContentViewAppAboutButtonPresses:Int    = 0
    @State private var cContentViewAppHelpViewButtonPresses:Int = 0
    @State private var cContentViewAppLogViewButtonPresses:Int  = 0
    @State private var cContentViewAppCrashButtonPresses:Int    = 0

    @State private var isAppAboutViewModal:Bool                 = false
    @State private var isAppHelpViewModal:Bool                  = false
    @State private var isAppLogViewModal:Bool                   = false
    @State private var isAppCrashShowing:Bool                   = false
    
    var jmAppDelegateVisitor:JmAppDelegateVisitor               = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    init()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Exit...

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

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
        
        let _ = self.xcgLogMsg("...'SettingsSingleViewIos(.swift):body' \(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)...")

        Spacer()

        NavigationView
        {

            VStack(alignment:.leading)              // VStack #1
            {

                Spacer()
                    .frame(height:5)
                
                HStack(alignment:.center)           // HStack #1.3
                {

                //  if #available(iOS 18.0, *) 
                //  {
                //      TipView(appAboutTip, arrowEdge:.bottom)
                //  } 
                //  else 
                //  {
                //      // Fallback on earlier versions
                //  //  TipView(appAboutTip)
                //  }
                
                    Button
                    {

                        self.cContentViewAppAboutButtonPresses += 1

                        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):SettingsSingleView in Button(Xcode).'App About'.#(\(self.cContentViewAppAboutButtonPresses))...")

                        self.isAppAboutViewModal.toggle()

                    }
                    label:
                    {
                        
                        VStack(alignment:.center)
                        {
                            
                            Label("", systemImage: "questionmark.diamond")
                                .help(Text("App About Information"))
                                .imageScale(.large)
                            
                            Text("About")
                                .font(.caption)
                            
                        }
                        
                    }
                    .fullScreenCover(isPresented:$isAppAboutViewModal)
                    {
                    
                        AppAboutView()
                    
                    }
                    .popoverTip(appAboutTip)
//                if #available(iOS 18.0, *)
//                {
//                //  .popoverTip(AppAboutTip, arrowEdge:.bottom)
//                    .popoverTip(appAboutTip)
//                //  .popoverTip("", arrowEdge:.top)
//                }

                    Spacer()

                    Button
                    {

                        self.cContentViewAppHelpViewButtonPresses += 1

                        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):SettingsSingleView in Button(Xcode).'App HelpView'.#(\(self.cContentViewAppHelpViewButtonPresses))...")

                        self.isAppHelpViewModal.toggle()

                    }
                    label:
                    {
                        
                        VStack(alignment:.center)
                        {
                            
                            Label("", systemImage: "questionmark.circle")
                                .help(Text("App HELP Information"))
                                .imageScale(.large)
                            
                            Text("Help")
                                .font(.caption)
                            
                        }
                        
                    }
                    .fullScreenCover(isPresented:$isAppHelpViewModal)
                    {
                    
                        HelpBasicView(sHelpBasicContents: jmAppDelegateVisitor.getAppDelegateVisitorHelpBasicContents())
                            .navigationBarBackButtonHidden(true)
                    
                    }

                    Spacer()

                    Button
                    {

                        self.cContentViewAppLogViewButtonPresses += 1

                        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):SettingsSingleView in Button(Xcode).'App LogView'.#(\(self.cContentViewAppLogViewButtonPresses))...")

                        self.isAppLogViewModal.toggle()

                    }
                    label:
                    {
                        
                        VStack(alignment:.center)
                        {
                            
                            Label("", systemImage: "doc.text.magnifyingglass")
                                .help(Text("App LOG Viewer"))
                                .imageScale(.large)
                            
                            Text("View Log")
                                .font(.caption)
                            
                        }
                        
                    }
                    .fullScreenCover(isPresented:$isAppLogViewModal)
                    {
                    
                        LogFileView()
                    
                    }

                    Spacer()

                    Button
                    {

                        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):SettingsSingleView.Button(Xcode).'Dismiss' pressed...")
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                        //  dismiss()

                    }
                    label:
                    {
                        
                        VStack(alignment:.center)
                        {
                            
                            Label("", systemImage: "xmark.circle")
                                .help(Text("Dismiss this Screen"))
                                .imageScale(.large)
                            
                            Text("Dismiss")
                                .font(.caption)
                            
                        }
                        
                    }

                }   // End of HStack #1.1

                Spacer()

                HStack(alignment:.center)
                {

                    Spacer()
                
                    Button
                    {

                        self.cContentViewAppCrashButtonPresses += 1

                        let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp)ContentView in Button(Xcode).'App Crash'.#(\(self.cContentViewAppCrashButtonPresses))...")

                        self.isAppCrashShowing.toggle()

                    }
                    label:
                    {
                        
                        VStack(alignment:.center)
                        {
                            
                            Label("", systemImage: "autostartstop.slash")
                                .help(Text("FORCE this App to CRASH"))
                                .imageScale(.large)
                            
                            Text("Force CRASH")
                                .font(.caption)
                            
                        }
                        
                    }
                    .alert("Are you sure you want to 'crash' this App?", isPresented:$isAppCrashShowing)
                    {
                        Button("Cancel", role:.cancel)
                        {
                            let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Cancel' to 'crash' the App - resuming...")
                        }
                        Button("Ok", role:.destructive)
                        {
                            let _ = self.xcgLogMsg("\(ClassInfo.sClsDisp) User pressed 'Ok' to 'crash' the App - crashing...")
                            fatalError("The User pressed 'Ok' to force an App 'crash'!")
                        }
                    }

                    Spacer()

                }   // End of HStack

                Spacer()
                
                HStack(alignment:.center)
                {
                    
                    Spacer()
                    
                    Text(" - - - - - - - - - - - - - - - - - - - - ")
                        .bold()

                    Spacer()
                    
                }

                HStack(alignment:.center)
                {
                    
                    Spacer()
                    
                    VStack(alignment:.center)
                    {
                        
                        if #available(iOS 15.0, *) 
                        {
                            Text("Application Information:")
                                .bold()
                                .dynamicTypeSize(.small)
                            
                            Text("\(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)")     // <=== Version...
                                .italic()
                                .dynamicTypeSize(.small)

                            Text("\(JmXcodeBuildSettings.jmAppCopyright)")
                                .italic()
                                .dynamicTypeSize(.small)
                        }
                        else
                        {
                            Text("Application Information:")
                                .bold()
                            
                            Text("\(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)")     // <=== Version...
                                .italic()

                            Text("\(JmXcodeBuildSettings.jmAppCopyright)")
                                .italic()
                        }

                    }
                    
                    Spacer()
                    
                }

                HStack(alignment:.center)
                {
                    
                    Spacer()
                    
                    Text(" - - - - - - - - - - - - - - - - - - - - ")
                        .bold()

                    Spacer()
                    
                }

                Spacer()

            }   // End of VStack #1
            .padding()

        }
        
        Spacer()
        
    }
    
}

#Preview 
{
    
    SettingsSingleViewIos()
    
}

@available(iOS 17.0, *)
struct AppAboutTip: Tip
{

    var title:Text 
    {
        Text("App ABOUT Information")
    }

    var message:Text? 
    {
        Text("Display information details of this Application.")
    }

    var image:Image? 
    {
        Image(systemName: "questionmark.diamond")
    }

}


//
//  SettingsSingleViewIos.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 03/26/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import SwiftUI
// import TipKit

@available(iOS 16.0, *)
struct SettingsSingleViewIos: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "SettingsSingleViewIos"
        static let sClsVers      = "v1.0203"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }
    
    // App Data field(s):
    
//  @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode

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

    var body: some View 
    {
        
        let _ = self.xcgLogMsg("...'SettingsSingleViewIos(.swift):body'...")

        Spacer()

        NavigationView
        {

            VStack(alignment:.leading)              // VStack #1
            {

                Spacer()
                    .frame(height:5)
                
                HStack(alignment:.center)           // HStack #1.3
                {
                
                    Button
                    {

                        self.cContentViewAppAboutButtonPresses += 1

                        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):SettingsSingleView in Button(Xcode).'App About'.#(\(self.cContentViewAppAboutButtonPresses))...")

                        self.isAppAboutViewModal.toggle()

                    }
                    label: 
                    {
                        
                    //  Text("About")

                        Label("", systemImage: "questionmark.diamond")
                            .padding()
                            .imageScale(.large)
                            .help("App About Information")
                    //      .popoverTip("", arrowEdge:.top)

                    }
                    .fullScreenCover(isPresented:$isAppAboutViewModal)
                    {
                    
                        AppAboutView()
                    
                    }
                //  .background(Color(red: 0.8784, green: 1.0, blue: 1.0))
                //  .foregroundColor(.accentColor)

                    Spacer()

                    Button
                    {

                        self.cContentViewAppHelpViewButtonPresses += 1

                        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):SettingsSingleView in Button(Xcode).'App HelpView'.#(\(self.cContentViewAppHelpViewButtonPresses))...")

                        self.isAppHelpViewModal.toggle()

                    }
                    label: 
                    {
                        
                    //  Text("Help")

                        Label("", systemImage: "questionmark.circle")
                            .padding()
                            .imageScale(.large)
                            .help("App HELP Information")

                    }
                    .fullScreenCover(isPresented:$isAppHelpViewModal)
                    {
                    
                    //  HelpBasicView()
                        HelpBasicView(sHelpBasicContents: jmAppDelegateVisitor.getAppDelegateVisitorHelpBasicContents())
                            .navigationBarBackButtonHidden(true)
                    
                    }
                //  .background(Color(red: 0.8784, green: 1.0, blue: 1.0))
                //  .foregroundColor(.accentColor)

                    Spacer()

                    Button
                    {

                        self.cContentViewAppLogViewButtonPresses += 1

                        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):SettingsSingleView in Button(Xcode).'App LogView'.#(\(self.cContentViewAppLogViewButtonPresses))...")

                        self.isAppLogViewModal.toggle()

                    }
                    label: 
                    {
                        
                    //  Text("LogView")

                        Label("", systemImage: "doc.text.magnifyingglass")
                            .padding()
                            .imageScale(.large)
                            .help("App LOG Viewer")

                    }
                    .fullScreenCover(isPresented:$isAppLogViewModal)
                    {
                    
                        LogFileView()
                    
                    }
                //  .background(Color(red: 0.8784, green: 1.0, blue: 1.0))
                //  .foregroundColor(.accentColor)

                    Spacer()

                //  Button("Dismiss") 
                    Button
                    {

                        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):SettingsSingleView.Button(Xcode).'Dismiss' pressed...")
                        
                        self.presentationMode.wrappedValue.dismiss()
                        
                        //  dismiss()

                    }
                    label: 
                    {

                        Label("", systemImage: "xmark.circle")
                            .padding()
                            .imageScale(.large)
                            .help("Dismiss this Screen")

                    }
                //  .background(Color(red: 0.8784, green: 1.0, blue: 1.0))
                //  .foregroundColor(.accentColor)

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

                        Label("", systemImage: "xmark.octagon")
                            .padding()
                            .imageScale(.large)
                            .help("FORCE this App to CRASH")

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
        //  .frame(minWidth: 50, idealWidth: 200, maxWidth: .infinity, minHeight: 70, idealHeight: 100, maxHeight: .infinity)

        }
        
        Spacer()
        
    }
    
    func xcgLogMsg(_ sMessage:String)
    {

    //  print("\(sMessage)")
        self.jmAppDelegateVisitor.xcgLogMsg("\(sMessage)")

        // Exit...

        return

    }   // End of func xcgLogMsg().

}

#Preview 
{
    
    SettingsSingleViewIos()
    
}


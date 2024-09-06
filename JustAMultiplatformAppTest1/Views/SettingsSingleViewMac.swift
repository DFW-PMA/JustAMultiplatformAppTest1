//
//  SettingsSingleViewMac.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 03/26/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

struct SettingsSingleViewMac: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "SettingsSingleViewMac"
        static let sClsVers      = "v1.0103"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }
    
    // App Data field(s):

    var jmAppDelegateVisitor:JmAppDelegateVisitor            = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    @State private var cContentViewAppCrashButtonPresses:Int = 0

    @State private var isAppCrashShowing:Bool                = false

    init()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Exit...

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of init().

    func xcgLogMsg(_ sMessage:String)
    {

    //  print("\(sMessage)")
        self.jmAppDelegateVisitor.xcgLogMsg("\(sMessage)")

        // Exit...

        return

    }   // End of func xcgLogMsg().

    var body: some View 
    {
        
        let _ = self.xcgLogMsg("...'SettingsSingleViewMac(.swift):body' \(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)...")

        VStack(alignment:.leading)              // VStack #1
        {

            Spacer()
                .frame(height:5)
            
            Divider()
                .border(Color.purple, width:5)

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
            
            Divider()
                .border(Color.purple, width:5)
            
            Spacer()
                .frame(height:5)
            
        //  HStack(alignment:.center)           // HStack #1.1
        //  {
        //  
        //      Spacer()
        //          .frame(width:30)
        //      
        //      Text("Preferences:")
        //  
        //  }   // End of HStack #1.1
        //
        //  Divider()
        //      .border(Color.purple, width:5)
        //
        //  Spacer()
        //      .frame(height:5)
        //
        //  HStack(alignment:.bottom)   // HStack #1.2
        //  {
        //
        //      Spacer()
        //          .frame(width:60, height:10)
        //
        //      Text("Settings field #1...")
        //          .frame(alignment:.bottom)
        //
        //      Spacer()
        //          .frame(width:60, height:10)
        //
        //  }   // End of HStack #1.2
            
            Spacer()
                .frame(height:5)

        }   // End of VStack #1
        .background(Color.black)
        .frame(minWidth: 250, idealWidth: 300, maxWidth: .infinity, minHeight: 70, idealHeight: 100, maxHeight: .infinity)
        
    }
    
}

#Preview 
{
    
    SettingsSingleViewMac()
    
}


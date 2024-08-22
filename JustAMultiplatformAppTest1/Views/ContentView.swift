//
//  ContentView.swift
//  JustAMultiplatformAppTest1
//
//  Created by Daryl Cox on 07/19/24.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

struct ContentView: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "ContentView"
        static let sClsVers      = "v1.0601"
        static let sClsDisp      = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // AppDelegate (via @EnvironmentObject - automatic via the App's @NSApplicationDelegateAdaptor property wrapper

    @EnvironmentObject private var appDelegate:JustAMultiplatformAppTest1NSAppDelegate

    // App Data field(s):

    @State private var cContentViewRefreshButtonPresses:Int = 0

    @State private var shouldContentViewShowAlert:Bool      = false
    
    var body: some View 
    {

    //  let _ = xcgLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):body(some Scene) \(ClassInfo.sClsCopyRight)...")
        let _ = xcgLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):body(some Scene) \(JmXcodeBuildSettings.jmAppCopyright)...")
        
        VStack 
        {
            
            Spacer()
            
        if #available(iOS 17.0, *)
        {

            Image(ImageResource(name: "Gfx/AppIcon", bundle: Bundle.main))
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal)
                    { size, axis in
                        size * 0.2
                    }

        }
        else
        {

            Image(ImageResource(name: "Gfx/AppIcon", bundle: Bundle.main))
                .resizable()
                .scaledToFit()
                .frame(width:100, height: 100, alignment:.center)

        }
            
            Spacer(minLength: 10)
            
            Text("Hello, world!")
                .onReceive(appDelegate.$isAppDelegateShowingAlert,
                    perform:
                    { bShow in
                        if (bShow == true)
                        {
                            shouldContentViewShowAlert            = true
                            appDelegate.isAppDelegateShowingAlert = false
                        }
                    })
                .alert("\(appDelegate.sAppDelegateGlobalAlertMessage ?? "")", isPresented:$shouldContentViewShowAlert)
                {

                    Button("\(appDelegate.sAppDelegateGlobalAlertButtonText ?? "")", role:.cancel) { }

                }
            
            Spacer()
            
            Text("--- [JustAMultiplatformAppTest1] \(ClassInfo.sClsDisp).ContentView.body(someView) ---")
            Text("")
            Text("\(JmXcodeBuildSettings.jmAppCopyright)")
        //  Text("\(ClassInfo.sClsCopyRight)")
            
            Spacer()
            
            Button("Refresh - #(\(self.cContentViewRefreshButtonPresses))...")
            {
                
                self.cContentViewRefreshButtonPresses += 1
                
                let _ = xcgLoggerMsg(sMessage:"...\(ClassInfo.sClsDisp),ContentView in Button(Xcode).'Refresh'.#(\(self.cContentViewRefreshButtonPresses))...")

            }
            .controlSize(.regular)
            .background(Color(red: 0, green: 0.5, blue: 0.5))
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }
        .padding()
        
    }
    
    func xcgLoggerMsg(sMessage:String)
    {

        self.appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLoggerMsg().

}

#Preview 
{
    
    ContentView()
    
}

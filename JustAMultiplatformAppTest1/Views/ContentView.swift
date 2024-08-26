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
        static let sClsVers      = "v1.0802"
        static let sClsDisp      = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

//  // AppDelegate (via @EnvironmentObject - automatic via the App's @NSApplicationDelegateAdaptor property wrapper
//
//  @EnvironmentObject private var appDelegate:JustAMultiplatformAppTest1NSAppDelegate

    // App Data field(s):

    @State private var cContentViewRefreshButtonPresses:Int = 0

    @State private var shouldContentViewShowAlert:Bool      = false
    
    var jmAppDelegateVisitor:JmAppDelegateVisitor           = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    func xcgLogMsg(_ sMessage:String)
    {

    //  print("\(sMessage)")
        self.jmAppDelegateVisitor.xcgLogMsg(sMessage)

        // Exit:

        return

    }   // End of func xcgLogMsg().

    var body: some View 
    {

        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):body(some Scene) \(JmXcodeBuildSettings.jmAppCopyright)...")
        
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
            
            Text("--- [\(AppGlobalInfo.sGlobalInfoAppId)] \(ClassInfo.sClsDisp).ContentView.body(someView) ---")
            Text("")
            Text("\(JmXcodeBuildSettings.jmAppCopyright)")
            
            Spacer()
            
            Button("Refresh - #(\(self.cContentViewRefreshButtonPresses))...")
            {
                
                self.cContentViewRefreshButtonPresses += 1
                
                let _ = xcgLogMsg("...\(ClassInfo.sClsDisp),ContentView in Button(Xcode).'Refresh'.#(\(self.cContentViewRefreshButtonPresses))...")

            }
            .controlSize(.regular)
            .background(Color(red: 0, green: 0.5, blue: 0.5))
            .foregroundStyle(.white)
            .buttonStyle(.borderedProminent)
            
            Spacer()
            
        }
        .padding()
        
    }
    
}

#Preview 
{
    
    ContentView()
    
}

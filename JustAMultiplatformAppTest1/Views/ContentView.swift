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

struct ContentView: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "ContentView"
        static let sClsVers      = "v1.0811"
        static let sClsDisp      = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

//  // AppDelegate (via @EnvironmentObject - automatic via the App's @NSApplicationDelegateAdaptor property wrapper
//
//  @EnvironmentObject private var appDelegate:JustAMultiplatformAppTest1NSAppDelegate

    // App Data field(s):

#if os(iOS)

    @State private var cAppViewSuspendButtonPresses:Int  = 0
    @State private var cAppViewSettingsButtonPresses:Int = 0
    
    @State private var isAppSuspendShowing:Bool          = false
    @State private var isAppSettingsModal:Bool           = false

#endif

    @State private var cContentViewRefreshButtonPresses:Int = 0

    @State private var shouldContentViewShowAlert:Bool      = false
    
    var jmAppDelegateVisitor:JmAppDelegateVisitor           = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
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
        self.jmAppDelegateVisitor.xcgLogMsg(sMessage)

        // Exit:

        return

    }   // End of func xcgLogMsg().

    var body: some View 
    {

        let _ = xcgLogMsg("\(ClassInfo.sClsDisp):body(some Scene) \(JmXcodeBuildSettings.jmAppCopyright)...")
        
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
            
            Text("\(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)")     // <=== Version...
                .italic()

            Spacer(minLength: 4)

            Text("\(JmXcodeBuildSettings.jmAppCopyright)")
                .italic()
            
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

//  func askIfQuitIsOkOrCancel()
//  {
//
//      let sCurrMethod:String = #function
//      let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
//      
//      self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")
//
//      let uiAlertQuit = UIAlertController(title:          "Quit", 
//                                          message:        "Are you sure you want to 'quit'?", 
//                                          preferredStyle: UIAlertController.Style.alert)
//
//      uiAlertQuit.addAction(UIAlertAction(title: "Ok", 
//                                          style: .default, 
//                                          handler: { (action: UIAlertAction!) in
//                                                       self.xcgLogMsg("\(sCurrMethodDisp) User pressed 'Ok' to 'quit' the App - suspending...")
//                                                       UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
//                                                   }))
//
//      uiAlertQuit.addAction(UIAlertAction(title: "Cancel", 
//                                          style: .cancel, 
//                                          handler: { (action: UIAlertAction!) in
//                                                       self.xcgLogMsg("\(sCurrMethodDisp) User pressed 'Cancel' to 'quit' the App - resuming...")
//                                                   }))
//
//  //  presentViewController(uiAlertQuit, animated: true, completion: nil)
//      uiAlertQuit.show(self, sender: Any?)
//
//      // Exit:
//
//      self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")
//
//      return
//
//  }   // End of func askIfQuitIsOkOrCancel().
    
}

#Preview 
{
    
    ContentView()
    
}

//
//  JustASwiftLogTest1App.swift
//  JustASwiftLogTest1
//
//  Created by Daryl Cox on 07/17/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

@main
struct JustASwiftLogTest1App: App 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "JustASwiftLogTest1App"
        static let sClsVers      = "v1.0107"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // App Data field(s):

    @NSApplicationDelegateAdaptor(JustASwiftLogTest1AppDelegate.self)
    var appDelegate

    let sAppBundlePath:String = Bundle.main.bundlePath

    var body: some Scene 
    {
        
    //  let _ = print("...\(ClassInfo.sClsDisp):body - 'sAppBundlePath' is [\(sAppBundlePath)]...")
        
        let _ = swLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):body(some Scene) - 'sAppBundlePath' is [\(sAppBundlePath)]...")
        
        WindowGroup 
        {
            
            ContentView()
            
        }
        
    }
    
    func swLoggerMsg(sMessage:String)
    {

        let sTraceCls:String       = ClassInfo.sClsId
        let sCurrMethod:String     = #function
        let sCurrMethodDisp:String = "'"+sCurrMethod+"'"
        let appDelegate:JustASwiftLogTest1AppDelegate
                                   = JustASwiftLogTest1AppDelegate.ClassSingleton.appDelegate!

    //  print("...Inside \(ClassInfo.sClsDisp).swLoggerMsg() - \(sMessage)...")

        appDelegate.swiftLogger?.info("\(sMessage)")

        return

    }   // End of func swLoggerMsg().

}


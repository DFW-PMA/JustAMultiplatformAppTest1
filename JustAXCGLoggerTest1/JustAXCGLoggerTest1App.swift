//
//  JustAXCGLoggerTest1App.swift
//  JustAXCGLoggerTest1
//
//  Created by Daryl Cox on 07/19/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

@main
struct JustAXCGLoggerTest1App: App 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "JustAXCGLoggerTest1App"
        static let sClsVers      = "v1.0101"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // App Data field(s):

    @NSApplicationDelegateAdaptor(JustAXCGLoggerTest1AppDelegate.self)
    var appDelegate

    let sAppBundlePath:String = Bundle.main.bundlePath

    var body: some Scene 
    {
        
    //  let _ = print("...\(ClassInfo.sClsDisp):body - 'sAppBundlePath' is [\(sAppBundlePath)]...")
        
        let _ = xcgLogger(sMessage:"\(ClassInfo.sClsDisp):body(some Scene) - 'sAppBundlePath' is [\(sAppBundlePath)]...")
        
        WindowGroup 
        {
            
            ContentView()
            
        }
        
    }
    
    func xcgLogger(sMessage:String)
    {

        let sTraceCls:String       = ClassInfo.sClsId
        let sCurrMethod:String     = #function
        let sCurrMethodDisp:String = "'"+sCurrMethod+"'"
        let appDelegate:JustAXCGLoggerTest1AppDelegate
                                   = JustAXCGLoggerTest1AppDelegate.ClassSingleton.appDelegate!

    //  print("...Inside \(ClassInfo.sClsDisp).xcgLogger() - \(sMessage)...")

        appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLogger().

}


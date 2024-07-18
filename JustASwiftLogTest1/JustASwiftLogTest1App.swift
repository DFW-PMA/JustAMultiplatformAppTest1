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
        static let sClsVers      = "v1.0102"
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
        
        let _ = print("...\(ClassInfo.sClsDisp):body - 'sAppBundlePath' is [\(sAppBundlePath)]...")
        
        WindowGroup 
        {
            
            ContentView()
            
        }
        
    }
    
}


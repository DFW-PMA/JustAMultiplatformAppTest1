//
//  SettingsSingleView.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 03/26/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

struct SettingsSingleView: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "SettingsSingleView"
        static let sClsVers      = "v1.0703"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }
    
    // App Data field(s):

    var jmAppDelegateVisitor:JmAppDelegateVisitor = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
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
        
        let _ = self.xcgLogMsg("...'SettingsSingleView(.swift):body' \(JmXcodeBuildSettings.jmAppVersionAndBuildNumber)...")

    #if os(macOS)

        SettingsSingleViewMac()

    #elseif os(iOS)

        SettingsSingleViewIos()

    #endif

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
    
    SettingsSingleView()
    
}


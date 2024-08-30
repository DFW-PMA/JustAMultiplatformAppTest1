//
//  SettingsSingleViewMac.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 03/26/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import SwiftUI

struct SettingsSingleViewMac: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "SettingsSingleViewMac"
        static let sClsVers      = "v1.0101"
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
        
        let _ = self.xcgLogMsg("...'SettingsSingleViewMac(.swift):body'...")

        VStack(alignment:.leading)              // VStack #1
        {

            Spacer()
                .frame(height:5)
            
            Divider()
                .border(Color.purple, width:5)
            
            HStack(alignment:.center)           // HStack #1.1
            {
            
                Spacer()
                    .frame(width:30)
                
                Text("Preferences:")
            
            }   // End of HStack #1.1

            Divider()
                .border(Color.purple, width:5)

            Spacer()
                .frame(height:5)

            HStack(alignment:.bottom)   // HStack #1.2
            {

                Spacer()
                    .frame(width:60, height:10)

                Text("Settings field #1...")
                    .frame(alignment:.bottom)

                Spacer()
                    .frame(width:60, height:10)

            }   // End of HStack #1.2
            
            Spacer()
                .frame(height:5)

        }   // End of VStack #1
        .background(Color.black)
        .frame(minWidth: 250, idealWidth: 300, maxWidth: .infinity, minHeight: 70, idealHeight: 100, maxHeight: .infinity)
        
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
    
    SettingsSingleViewMac()
    
}


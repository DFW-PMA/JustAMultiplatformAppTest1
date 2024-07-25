//
//  SettingsSingleView.swift
//  JustAXCGLoggerWithLogonTest2
//
//  Created by JustMacApps.net on 03/26/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import SwiftUI

struct SettingsSingleView: View 
{
    
    struct ClassInfo
    {
        
        static let sClsId        = "SettingsSingleView"
        static let sClsVers      = "v1.0402"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }
    
    var body: some View 
    {
        
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
    
}

#Preview 
{
    
    SettingsSingleView()
    
}


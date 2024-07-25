//
//  ContentView.swift
//  JustAXCGLoggerWithLogonTest2
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
        static let sClsVers      = "v1.0201"
        static let sClsDisp      = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    var body: some View 
    {

        let _ = xcgLoggerMsg(sMessage:"\(ClassInfo.sClsDisp):body(some Scene) \(ClassInfo.sClsCopyRight)...")
        
        VStack 
        {
            
            Spacer()
            
            Image(systemName: "globe.desk.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Spacer(minLength: 10)
            
            Text("Hello, world!")
            
            Spacer()
            
            Text("--- [JustAXCGLoggerWithLogonTest2] \(ClassInfo.sClsDisp).ContentView.body(someView) ---")
            Text("")
            Text("\(ClassInfo.sClsCopyRight)")
            
            Spacer()
            
        }
        .padding()
        
    }
    
    func xcgLoggerMsg(sMessage:String)
    {

        let appDelegate:JustAXCGLoggerWithLogonTest2AppDelegate
                                   = JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!

        appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLoggerMsg().

}

#Preview 
{
    
    ContentView()
    
}

//
//  ContentView.swift
//  JustAXCGLoggerTest1
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
        static let sClsVers      = "v1.0101"
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
            
        //  Image(systemName: "globe")
            Image(systemName: "globe.desk.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Spacer(minLength: 10)
            
            Text("Hello, world!")
            
            Spacer()
            
            Text("--- [JustAXCGLoggerTest1] \(ClassInfo.sClsDisp).ContentView.body(someView) ---")
            Text("")
            Text("\(ClassInfo.sClsCopyRight)")
            
            Spacer()
            
        }
        .padding()
        
    }
    
    func xcgLoggerMsg(sMessage:String)
    {

        let sTraceCls:String       = ClassInfo.sClsId
        let sCurrMethod:String     = #function
        let sCurrMethodDisp:String = "'"+sCurrMethod+"'"
        let appDelegate:JustAXCGLoggerTest1AppDelegate
                                   = JustAXCGLoggerTest1AppDelegate.ClassSingleton.appDelegate!

    //  print("...Inside \(ClassInfo.sClsDisp).xcgLoggerMsg() - \(sMessage)...")

        appDelegate.xcgLogger?.info("\(sMessage)")

        return

    }   // End of func xcgLoggerMsg().

}

#Preview 
{
    
    ContentView()
    
}

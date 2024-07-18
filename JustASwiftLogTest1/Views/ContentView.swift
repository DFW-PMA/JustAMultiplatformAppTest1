//
//  ContentView.swift
//  JustASwiftLogTest1
//
//  Created by Daryl Cox on 07/17/24.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import SwiftUI

struct ContentView: View 
{
    
    var body: some View 
    {
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
            
            Text("--- JustASwiftLogTest1(.swift).(v1.0102).ContentView.body(someView) ---")
            
            Spacer()
            
        }
        .padding()
        
    }
    
}

#Preview 
{
    
    ContentView()
    
}

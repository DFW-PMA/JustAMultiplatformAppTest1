//
//  JustAMultiplatformAppTest1NSAppDelegate.swift
//  JustAMultiplatformAppTest1
//
//  Created by JustMacApps.net on 07/19/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

//import Cocoa
import Foundation
import SwiftUI
import XCGLogger

class JustAMultiplatformAppTest1NSAppDelegate: NSObject, NSApplicationDelegate, ObservableObject
{

    struct ClassInfo
    {
        
        static let sClsId          = "JustAMultiplatformAppTest1NSAppDelegate"
        static let sClsVers        = "v1.1001"
        static let sClsDisp        = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    struct ClassSingleton
    {

        static var appDelegate:JustAMultiplatformAppTest1NSAppDelegate? = nil

    }

    // Various App field(s):

    var cAppDelegateInitCalls:Int                   = 0

    var jmAppDelegateVisitor:JmAppDelegateVisitor   = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor

    public func toString()->String
    {

        var asToString:[String] = Array()

        asToString.append("[")
        asToString.append("[")
        asToString.append("'sClsId': [\(ClassInfo.sClsId)],")
        asToString.append("'sClsVers': [\(ClassInfo.sClsVers)],")
        asToString.append("'sClsDisp': [\(ClassInfo.sClsDisp)],")
        asToString.append("'sClsCopyRight': [\(ClassInfo.sClsCopyRight)],")
        asToString.append("'bClsTrace': [\(ClassInfo.bClsTrace)],")
        asToString.append("],")
        asToString.append("[")
        asToString.append("'cAppDelegateInitCalls': (\(self.cAppDelegateInitCalls)),")
        asToString.append("],")
        asToString.append("[")
        asToString.append("'jmAppDelegateVisitor': [\(self.jmAppDelegateVisitor)],")
        asToString.append("],")
        asToString.append("]")

        let sContents:String = "{"+(asToString.joined(separator: ""))+"}"

        return sContents

    }   // End of public func toString().

    override init()
    {
        
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        super.init()
        
        ClassSingleton.appDelegate  = self
        self.cAppDelegateInitCalls += 1
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - #(\(self.cAppDelegateInitCalls)) time(s) - 'sApplicationName' is [\(self.jmAppDelegateVisitor.sApplicationName)]...")

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - #(\(self.cAppDelegateInitCalls)) time(s) - 'sApplicationName' is [\(self.jmAppDelegateVisitor.sApplicationName)]...")

        return

    }   // End of init().
        
    public func xcgLogMsg(_ sMessage:String)
    {

    //  print("\(sMessage)")
        self.jmAppDelegateVisitor.xcgLogMsg(sMessage)

        // Exit:

        return

    }   // End of public func xcgLogMsg().

    func applicationWillFinishLaunching(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(self.jmAppDelegateVisitor.sApplicationName)] - 'self' is [\(self)]...")

        self.jmAppDelegateVisitor.appDelegateVisitorWillFinishLaunching(aNotification)

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Method Exiting...")

        return

    }   // End of func applicationWillFinishLaunching().

    func applicationDidFinishLaunching(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(self.jmAppDelegateVisitor.sApplicationName)] - 'self' is [\(self)]...")

        self.jmAppDelegateVisitor.appDelegateVisitorDidFinishLaunching(aNotification)

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Method Exiting...")

        return

    }   // End of func applicationDidFinishLaunching().

    func applicationWillTerminate(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(self.jmAppDelegateVisitor.sApplicationName)] - 'self' is [\(self)]...")

        self.xcgLogMsg("\(sCurrMethodDisp) Current '\(ClassInfo.sClsId)' is [\(self.toString())]...")
        self.xcgLogMsg("\(sCurrMethodDisp) AppDelegate is stopping...")

        self.jmAppDelegateVisitor.appDelegateVisitorWillTerminate(aNotification)

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Method Exiting...")

        ClassSingleton.appDelegate = nil

        return

    }   // End of func applicationWillTerminate().

    func application(_ application: NSApplication, open urls: [URL])
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - 'application' is [\(application)] - 'urls' are [\(urls)]...")

        self.xcgLogMsg("\(sCurrMethodDisp) Current '\(ClassInfo.sClsId)' is [\(self.toString())]...")
        self.xcgLogMsg("\(sCurrMethodDisp) -> Unhandled url(s) -> \(urls)")

        self.jmAppDelegateVisitor.appDelegateVisitorApplication(application, open:urls)

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Method Exiting...")

        return

    }   // End of func application().

}   // End of class JustAMultiplatformAppTest1NSAppDelegate(NSObject, NSApplicationDelegate, ObservableObject).


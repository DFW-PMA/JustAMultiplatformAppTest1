//
//  JustASwiftLogTest1AppDelegate.swift
//  JustASwiftLogTest1
//
//  Created by JustMacApps.net on 07/18/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import Cocoa
import Foundation
import SwiftUI

class JustASwiftLogTest1AppDelegate: NSObject, NSApplicationDelegate, ObservableObject
{

    struct ClassInfo
    {
        
        static let sClsId          = "JustASwiftLogTest1AppDelegate"
        static let sClsVers        = "v1.0101"
        static let sClsDisp        = sClsId+"(.swift).("+sClsVers+"): "
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        static let sClsLogFilespec = "JustASwiftLogTest1.log"
        
    }

    struct ClassSingleton
    {

        static var jmJustASwiftLogTest1AppDelegate:JustASwiftLogTest1AppDelegate? = nil

    }

    // App 'name' field:

    static
    let sApplicationName:String                  = "JustASwiftLogTest1"

    // Various App field(s):

    var cAppDelegateInitCalls:Int                = 0

    var bAppTitleSetupRequired:Bool              = true
    let bUseApplicationShortTitle:Bool           = false
    var sApplicationTitle:String                 = "-N/A-"
    let sApplicationShortTitle:String            = "JASLT1"

    // Misc:

    let bClsTraceInternal:Bool                   = true
    var bAppDelegateTraceLogInitRequired:Bool    = true
    var sInitAppDelegateTraceLogTag:String       = "-unknown-"

    open func toString()->String
    {

        var asToString:[String] = Array()

        asToString.append("[")
        asToString.append("[")
        asToString.append("'sClsId': [\(ClassInfo.sClsId)],")
        asToString.append("'sClsVers': [\(ClassInfo.sClsVers)],")
        asToString.append("'sClsDisp': [\(ClassInfo.sClsDisp)],")
        asToString.append("'sClsCopyRight': [\(ClassInfo.sClsCopyRight)],")
        asToString.append("'bClsTrace': [\(ClassInfo.bClsTrace)],")
        asToString.append("'bClsFileLog': [\(ClassInfo.bClsFileLog)],")
        asToString.append("],")
        asToString.append("[")
        asToString.append("'sApplicationName': [\(JustASwiftLogTest1AppDelegate.sApplicationName)],")
        asToString.append("],")
        asToString.append("[")
        asToString.append("'cAppDelegateInitCalls': (\(self.cAppDelegateInitCalls)),")
        asToString.append("],")
        asToString.append("[")
        asToString.append("'bAppTitleSetupRequired': [\(self.bAppTitleSetupRequired)],")
        asToString.append("'bUseApplicationShortTitle': [\(self.bUseApplicationShortTitle)],")
        asToString.append("'sApplicationTitle': [\(self.sApplicationTitle)],")
        asToString.append("],")
        asToString.append("[")
        asToString.append("'bClsTraceInternal': [\(self.bClsTraceInternal)],")
        asToString.append("'bAppDelegateTraceLogInitRequired': [\(self.bAppDelegateTraceLogInitRequired)],")
        asToString.append("'sInitAppDelegateTraceLogTag': [\(self.sInitAppDelegateTraceLogTag)],")
        asToString.append("],")
        asToString.append("]")

        let sContents:String = "{"+(asToString.joined(separator: ""))+"}"

        return sContents

    }   // End of public func toString().

    override init()
    {
        
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"'"

        super.init()
        
        ClassSingleton.jmJustASwiftLogTest1AppDelegate = self

        self.cAppDelegateInitCalls += 1

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:"\(sCurrMethodDisp)<>\(self.cAppDelegateInitCalls)")

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Method Invoked - 'sApplicationName' is [\(JustASwiftLogTest1AppDelegate.sApplicationName)]...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

        // Exit:

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Method Exiting - 'sApplicationName' is [\(JustASwiftLogTest1AppDelegate.sApplicationName)]...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

        return

    }   // End of init().
        
    func initAppDelegateTraceLog(initappdelegatetracelogtag:String = "-unknown-")
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"'"

        if (self.bAppDelegateTraceLogInitRequired == true)
        {

            print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) AppDelegate is starting - parameter 'initappdelegatetracelogtag' is [\(initappdelegatetracelogtag)]...")

            self.sInitAppDelegateTraceLogTag = initappdelegatetracelogtag

            if (self.sInitAppDelegateTraceLogTag.count < 1)
            {

                self.sInitAppDelegateTraceLogTag = "-unknown-"

                let sSearchMessage:String = "Supplied 'init' AppDelegate Trace Log loader TAG string is an 'empty' string - defaulting it to [\(self.sInitAppDelegateTraceLogTag)] - Warning!"

                print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) \(sSearchMessage)")

            }

            print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) AppDelegate TraceLog setup was called by [\(self.sInitAppDelegateTraceLogTag)]...")
            print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

            self.bAppDelegateTraceLogInitRequired = false

        }

        // Exit:

        return

    }   // End of func initAppDelegateTraceLog().

    func getAppDelegateApplicationTitle() -> String
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"'"

        if (self.bAppTitleSetupRequired == true)
        {

            print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Setting up the Application 'title'...")

            self.initAppDelegateTraceLog(initappdelegatetracelogtag:sCurrMethodDisp)

            if (self.bUseApplicationShortTitle == true)
            {

                self.sApplicationTitle = JustASwiftLogTest1AppDelegate.sApplicationName

            }
            else
            {

                self.sApplicationTitle = self.sApplicationShortTitle

            }

            print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Set up of the Application 'title' of [\(self.sApplicationTitle)] done...")
            print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

            self.bAppTitleSetupRequired = false

        }

        // Exit:

        return self.sApplicationTitle

    }   // End of func getAppDelegateApplicationTitle().

    func applicationWillFinishLaunching(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"'"

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:sCurrMethodDisp)

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(JustASwiftLogTest1AppDelegate.sApplicationName)]...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

        // Exit:

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Method Exiting...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

    }   // End of func applicationWillFinishLaunching().

    func applicationDidFinishLaunching(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"'"
        let cArgs              = Int(CommandLine.argc)

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:sCurrMethodDisp)

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(JustASwiftLogTest1AppDelegate.sApplicationName)]...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) The Command line input #(\(cArgs)) parameters...")
        
        for i in 0..<cArgs
        {
            
            let sArg  = String(cString: CommandLine.unsafeArgv[i]!)
            let sArgV = sArg
            
            print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Input parameter #(\(i)) is [\(sArgV)]...")
            
        }

        // Exit:

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Method Exiting...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

    }   // End of func applicationDidFinishLaunching().

    func applicationWillTerminate(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"'"

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)]...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Current '\(ClassInfo.sClsId)' is [\(self.toString())]...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) AppDelegate is stopping...")

        // Exit:

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Method Exiting...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

        ClassSingleton.jmJustASwiftLogTest1AppDelegate = nil

    }   // End of func applicationWillTerminate().

    func application(_ application: NSApplication, open urls: [URL])
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"'"

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Invoked - 'application' is [\(application)] - 'urls' are [\(urls)]...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Current '\(ClassInfo.sClsId)' is [\(self.toString())]...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) -> Unhandled url(s) -> \(urls)")

        // Exit:

        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) Method Exiting...")
        print("\(ClassInfo.sClsDisp).\(sCurrMethodDisp) ")

    }   // End of func application().

}   // End of class JustASwiftLogTest1AppDelegate(NSObject, NSApplicationDelegate).


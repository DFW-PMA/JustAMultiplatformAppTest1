//
//  JustASwiftLogWithXCGLoggerTest1AppDelegate.swift
//  JustASwiftLogWithXCGLoggerTest1
//
//  Created by JustMacApps.net on 07/19/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import Cocoa
import Foundation
import SwiftUI
import Logging

class JustASwiftLogWithXCGLoggerTest1AppDelegate: NSObject, NSApplicationDelegate, ObservableObject
{

    struct ClassInfo
    {
        
        static let sClsId          = "JustASwiftLogWithXCGLoggerTest1AppDelegate"
        static let sClsVers        = "v1.0101"
        static let sClsDisp        = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        static let sClsLogFilespec = "JustASwiftLogWithXCGLoggerTest1.log"
        
    }

    struct ClassSingleton
    {

        static var appDelegate:JustASwiftLogWithXCGLoggerTest1AppDelegate? = nil

    }

    // App 'name' field:

    static
    let sApplicationName:String                  = "JustASwiftLogWithXCGLoggerTest1"

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
    var swiftLogger:Logger?                      = nil

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
        asToString.append("'sApplicationName': [\(JustASwiftLogWithXCGLoggerTest1AppDelegate.sApplicationName)],")
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
        asToString.append("'swiftLogger': [\(self.swiftLogger)],")
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
        
        ClassSingleton.appDelegate = self

        self.cAppDelegateInitCalls += 1

    //  self.swiftLogger = Logger(label: "net.justmacapps.\(JustASwiftLogWithXCGLoggerTest1AppDelegate.sApplicationName)")
        self.swiftLogger = Logger(label: "net.justmacapps")

        self.swiftLogger?.info("\(sCurrMethodDisp) AppDelegate is starting - SwiftLog 'logger' instance has been created...")
        
        self.swiftLogger?.info("\(sCurrMethodDisp) Method Invoked - 'sApplicationName' is [\(JustASwiftLogWithXCGLoggerTest1AppDelegate.sApplicationName)]...")

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:"\(sCurrMethodDisp)<>\(self.cAppDelegateInitCalls)")

        // Exit:

        self.swiftLogger?.info("\(sCurrMethodDisp) Method Exiting - 'sApplicationName' is [\(JustASwiftLogWithXCGLoggerTest1AppDelegate.sApplicationName)]...")

        return

    }   // End of init().
        
    func initAppDelegateTraceLog(initappdelegatetracelogtag:String = "-unknown-")
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        if (self.bAppDelegateTraceLogInitRequired == true)
        {
            
        //  let logger = Logger(label: "net.justmacapps.\(JustASwiftLogWithXCGLoggerTest1AppDelegate.sApplicationName)")
        //  
        //  logger.info("\(sCurrMethodDisp) AppDelegate is starting - SwiftLog 'logger' instance has been created...")

            self.swiftLogger?.info("\(sCurrMethodDisp) AppDelegate is starting - parameter 'initappdelegatetracelogtag' is [\(initappdelegatetracelogtag)]...")

            self.sInitAppDelegateTraceLogTag = initappdelegatetracelogtag

            if (self.sInitAppDelegateTraceLogTag.count < 1)
            {

                self.sInitAppDelegateTraceLogTag = "-unknown-"

                let sSearchMessage:String = "Supplied 'init' AppDelegate Trace Log loader TAG string is an 'empty' string - defaulting it to [\(self.sInitAppDelegateTraceLogTag)] - Warning!"

                self.swiftLogger?.info("\(sCurrMethodDisp) \(sSearchMessage)")

            }

            self.swiftLogger?.info("\(sCurrMethodDisp) AppDelegate TraceLog setup was called by [\(self.sInitAppDelegateTraceLogTag)]...")

            self.bAppDelegateTraceLogInitRequired = false

        }

        // Exit:

        return

    }   // End of func initAppDelegateTraceLog().

    func getAppDelegateApplicationTitle() -> String
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        if (self.bAppTitleSetupRequired == true)
        {

            self.swiftLogger?.info("\(sCurrMethodDisp) Setting up the Application 'title'...")

            self.initAppDelegateTraceLog(initappdelegatetracelogtag:sCurrMethodDisp)

            if (self.bUseApplicationShortTitle == true)
            {

                self.sApplicationTitle = JustASwiftLogWithXCGLoggerTest1AppDelegate.sApplicationName

            }
            else
            {

                self.sApplicationTitle = self.sApplicationShortTitle

            }

            self.swiftLogger?.info("\(sCurrMethodDisp) Set up of the Application 'title' of [\(self.sApplicationTitle)] done...")

            self.bAppTitleSetupRequired = false

        }

        // Exit:

        return self.sApplicationTitle

    }   // End of func getAppDelegateApplicationTitle().

    func applicationWillFinishLaunching(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:sCurrMethodDisp)

        self.swiftLogger?.info("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(JustASwiftLogWithXCGLoggerTest1AppDelegate.sApplicationName)]...")

        // Exit:

        self.swiftLogger?.info("\(sCurrMethodDisp) Method Exiting...")

    }   // End of func applicationWillFinishLaunching().

    func applicationDidFinishLaunching(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        let cArgs              = Int(CommandLine.argc)

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:sCurrMethodDisp)

        self.swiftLogger?.info("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(JustASwiftLogWithXCGLoggerTest1AppDelegate.sApplicationName)]...")
        self.swiftLogger?.info("\(sCurrMethodDisp) The Command line input #(\(cArgs)) parameters...")
        
        for i in 0..<cArgs
        {
            
            let sArg  = String(cString: CommandLine.unsafeArgv[i]!)
            let sArgV = sArg
            
            self.swiftLogger?.info("\(sCurrMethodDisp) Input parameter #(\(i)) is [\(sArgV)]...")
            
        }

        // Exit:

        self.swiftLogger?.info("\(sCurrMethodDisp) Method Exiting...")

    }   // End of func applicationDidFinishLaunching().

    func applicationWillTerminate(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.swiftLogger?.info("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)]...")
        self.swiftLogger?.info("\(sCurrMethodDisp) Current '\(ClassInfo.sClsId)' is [\(self.toString())]...")

        self.swiftLogger?.info("\(sCurrMethodDisp) AppDelegate is stopping...")

        // Exit:

        self.swiftLogger?.info("\(sCurrMethodDisp) Method Exiting...")

        ClassSingleton.appDelegate = nil

    }   // End of func applicationWillTerminate().

    func application(_ application: NSApplication, open urls: [URL])
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.swiftLogger?.info("\(sCurrMethodDisp) Invoked - 'application' is [\(application)] - 'urls' are [\(urls)]...")
        self.swiftLogger?.info("\(sCurrMethodDisp) Current '\(ClassInfo.sClsId)' is [\(self.toString())]...")

        self.swiftLogger?.info("\(sCurrMethodDisp) -> Unhandled url(s) -> \(urls)")

        // Exit:

        self.swiftLogger?.info("\(sCurrMethodDisp) Method Exiting...")

    }   // End of func application().

}   // End of class JustASwiftLogWithXCGLoggerTest1AppDelegate(NSObject, NSApplicationDelegate, ObservableObject).


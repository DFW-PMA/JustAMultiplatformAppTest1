//
//  JustAXCGLoggerTest1AppDelegate.swift
//  JustAXCGLoggerTest1
//
//  Created by JustMacApps.net on 07/19/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import Cocoa
import Foundation
import SwiftUI
import Logging
import XCGLogger

class JustAXCGLoggerTest1AppDelegate: NSObject, NSApplicationDelegate, ObservableObject
{

    struct ClassInfo
    {
        
        static let sClsId          = "JustAXCGLoggerTest1AppDelegate"
        static let sClsVers        = "v1.0202"
        static let sClsDisp        = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        static let sClsLogFilespec = "JustAXCGLoggerTest1.log"
        
    }

    struct ClassSingleton
    {

        static var appDelegate:JustAXCGLoggerTest1AppDelegate? = nil

    }

    // App 'name' field:

    static
    let sApplicationName:String                  = "JustAXCGLoggerTest1"

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
    var bAppDelegateLogFilespecIsUsable:Bool     = false
    var urlAppDelegateLogFilepath:URL?           = nil
    var urlAppDelegateLogFilespec:URL?           = nil
    var sAppDelegateLogFilespec:String!          = nil
    var sAppDelegateLogFilepath:String!          = nil
    var xcgLogger:XCGLogger?                     = XCGLogger.default

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
        asToString.append("'sApplicationName': [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)],")
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
        asToString.append("'bAppDelegateLogFilespecIsUsable': [\(String(describing: self.bAppDelegateLogFilespecIsUsable))],")
        asToString.append("'urlAppDelegateLogFilepath': [\(String(describing: self.urlAppDelegateLogFilepath))],")
        asToString.append("'urlAppDelegateLogFilespec': [\(String(describing: self.urlAppDelegateLogFilespec))],")
        asToString.append("'sAppDelegateLogFilespec': [\(String(describing: self.sAppDelegateLogFilespec))],")
        asToString.append("'sAppDelegateLogFilepath': [\(String(describing: self.sAppDelegateLogFilepath))],")
        asToString.append("'xcgLogger': [\(String(describing: self.xcgLogger))],")
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

        self.cAppDelegateInitCalls           += 1
        self.bAppDelegateLogFilespecIsUsable  = false

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:"\(sCurrMethodDisp)<>\(self.cAppDelegateInitCalls)")

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Invoked - 'sApplicationName' is [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)]...")

        self.xcgLogger?.info("\(sCurrMethodDisp) AppDelegate is starting...")
        self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' instance 'self.xcgLogger' is being used (default instance)...")
        
        // Exit:

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting - 'sApplicationName' is [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)]...")

        return

    }   // End of init().
        
    private func initAppDelegateTraceLog(initappdelegatetracelogtag:String = "-unknown-")
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        if (self.bAppDelegateTraceLogInitRequired == true)
        {
            
            self.setupAppDelegateTraceLogFile()
            self.setupAppDelegateXCGLogger()

            self.xcgLogger?.info("\(sCurrMethodDisp) parameter 'initappdelegatetracelogtag' is [\(initappdelegatetracelogtag)]...")

            self.sInitAppDelegateTraceLogTag = initappdelegatetracelogtag

            if (self.sInitAppDelegateTraceLogTag.count < 1)
            {

                self.sInitAppDelegateTraceLogTag = "-unknown-"

                let sSearchMessage:String = "Supplied 'init' AppDelegate Trace Log loader TAG string is an 'empty' string - defaulting it to [\(self.sInitAppDelegateTraceLogTag)] - Warning!"

                self.xcgLogger?.info("\(sCurrMethodDisp) \(sSearchMessage)")

            }

            self.xcgLogger?.info("\(sCurrMethodDisp) AppDelegate TraceLog setup was called by [\(self.sInitAppDelegateTraceLogTag)]...")

            self.bAppDelegateTraceLogInitRequired = false

        }

        // Exit:

        return

    }   // End of func initAppDelegateTraceLog().

    private func setupAppDelegateTraceLogFile()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        // Setup the AppDelegate (physical) 'log' file:

        do 
        {

        //  self.urlAppDelegateLogFilepath = try FileManager.default.url(for: .downloadsDirectory ,in: .userDomainMask ,appropriateFor: nil, create: true)
            self.urlAppDelegateLogFilepath = try FileManager.default.url(for: .documentDirectory ,in: .userDomainMask ,appropriateFor: nil, create: true)
            self.urlAppDelegateLogFilespec = self.urlAppDelegateLogFilepath?.appendingPathComponent(ClassInfo.sClsLogFilespec)
            self.sAppDelegateLogFilespec    = self.urlAppDelegateLogFilespec?.path
            self.sAppDelegateLogFilepath    = self.urlAppDelegateLogFilepath?.path

            print("'[\(String(describing: ClassInfo.sClsDisp))].init(...)' - ...'self.sAppDelegateLogFilespec' (computed) is [\(String(describing: self.sAppDelegateLogFilespec))]...")
            print("'[\(String(describing: ClassInfo.sClsDisp))].init(...)' - ...'self.sAppDelegateLogFilepath' (resolved #2) is [\(String(describing: self.sAppDelegateLogFilepath))]...")

            try FileManager.default.createDirectory(atPath: sAppDelegateLogFilepath, withIntermediateDirectories: true, attributes: nil)

            let sContents = "\(sCurrMethodDisp) Method Invoked - 'sApplicationName' is [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)]..."

            try sContents.write(toFile: self.sAppDelegateLogFilespec, atomically:true, encoding:String.Encoding.utf8)

            self.bAppDelegateLogFilespecIsUsable = true

        }
        catch
        {

            self.bAppDelegateLogFilespecIsUsable = false

            print("'[\(String(describing: ClassInfo.sClsDisp))].appInit(...)' - Failed to create the 'path' of [.documentDirectory] - Error: \(error)...")

        }

        // Exit:

        return

    }   // End of func setupAppDelegateTraceLogFile().

    private func setupAppDelegateXCGLogger()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        // Setup the AppDelegate XCGLogger instance:

        self.xcgLogger?.setup(level:             .verbose,
                              showLogIdentifier: true,
                              showFunctionName:  true,
                              showThreadName:    true,
                              showLevel:         true,
                              showFileNames:     true,
                              showLineNumbers:   true,
                              showDate:          true,
                              writeToFile:       self.urlAppDelegateLogFilespec,
                              fileLevel:         .verbose)

        let listXCGLoggerDestinations = self.xcgLogger?.destinations
        
        self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' (default) instance has these destinations (\(listXCGLoggerDestinations!.count)): [\(String(describing: listXCGLoggerDestinations))]...")
        
        for index in 0 ..< (listXCGLoggerDestinations!.count) 
        {

            self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' (default) instance destination #(\(index)) TYPE is [\(String(describing: type(of: listXCGLoggerDestinations?[index])))]...")
            self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' (default) instance destination #(\(index)) 'is' FileDestination [\(String(describing: (listXCGLoggerDestinations?[index] is FileDestination)))]...")
            self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' (default) instance destination #(\(index)) is [\(String(describing: listXCGLoggerDestinations?[index]))]...")

            if ((listXCGLoggerDestinations?[index] is FileDestination) == true)
            {

                let xcgFileDestination = listXCGLoggerDestinations?[index] as! FileDestination

                self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' FileDestination is writing to [\(String(describing: xcgFileDestination.writeToFileURL))]...")

            }

        }
        
        // Add basic app info, version info etc, to the start of the logs:

        self.xcgLogger?.logAppDetails()

        // Exit:

        return

    }   // End of func setupAppDelegateXCGLogger().

    func getAppDelegateApplicationTitle() -> String
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        if (self.bAppTitleSetupRequired == true)
        {

            self.xcgLogger?.info("\(sCurrMethodDisp) Setting up the Application 'title'...")

            if (self.bUseApplicationShortTitle == true)
            {

                self.sApplicationTitle = JustAXCGLoggerTest1AppDelegate.sApplicationName

            }
            else
            {

                self.sApplicationTitle = self.sApplicationShortTitle

            }

            self.xcgLogger?.info("\(sCurrMethodDisp) Set up of the Application 'title' of [\(self.sApplicationTitle)] done...")

            self.bAppTitleSetupRequired = false

        }

        // Exit:

        return self.sApplicationTitle

    }   // End of func getAppDelegateApplicationTitle().

    func applicationWillFinishLaunching(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogger?.info("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)]...")

        // Exit:

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting...")

    }   // End of func applicationWillFinishLaunching().

    func applicationDidFinishLaunching(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        let cArgs              = Int(CommandLine.argc)

        self.xcgLogger?.info("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)]...")
        self.xcgLogger?.info("\(sCurrMethodDisp) The Command line input #(\(cArgs)) parameters...")
        
        for i in 0..<cArgs
        {
            
            let sArg  = String(cString: CommandLine.unsafeArgv[i]!)
            let sArgV = sArg
            
            self.xcgLogger?.info("\(sCurrMethodDisp) Input parameter #(\(i)) is [\(sArgV)]...")
            
        }

        // Exit:

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting...")

    }   // End of func applicationDidFinishLaunching().

    func applicationWillTerminate(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogger?.info("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)]...")
        self.xcgLogger?.info("\(sCurrMethodDisp) Current '\(ClassInfo.sClsId)' is [\(self.toString())]...")

        self.xcgLogger?.info("\(sCurrMethodDisp) AppDelegate is stopping...")

        // Exit:

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting...")

        ClassSingleton.appDelegate = nil

    }   // End of func applicationWillTerminate().

    func application(_ application: NSApplication, open urls: [URL])
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogger?.info("\(sCurrMethodDisp) Invoked - 'application' is [\(application)] - 'urls' are [\(urls)]...")
        self.xcgLogger?.info("\(sCurrMethodDisp) Current '\(ClassInfo.sClsId)' is [\(self.toString())]...")

        self.xcgLogger?.info("\(sCurrMethodDisp) -> Unhandled url(s) -> \(urls)")

        // Exit:

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting...")

    }   // End of func application().

    open func clearAppDelegateTraceLogFile()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogger?.info("\(sCurrMethodDisp) Invoked...")

        // Clear the AppDelegate (trace) 'Log' file:

        if (self.bAppDelegateLogFilespecIsUsable == false)
        {

            self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting - 'self.bAppDelegateLogFilespecIsUsable' is [\(self.bAppDelegateLogFilespecIsUsable)]...")

            return

        }

        do 
        {

            let sContents = "\(sCurrMethodDisp) ...Clearing the AppDelegate (trace) 'Log' file [\(self.sAppDelegateLogFilespec)]..."

            try sContents.write(toFile: self.sAppDelegateLogFilespec, atomically:true, encoding:String.Encoding.utf8)

        }
        catch _
        {

            self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting - Exception in clearing the AppDelegate (trace) 'Log' file [\(self.sAppDelegateLogFilespec)]...")

            return

        }

        // Exit:

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting...")

    }   // End of open func clearAppDelegateTraceLogFile().

}   // End of class JustAXCGLoggerTest1AppDelegate(NSObject, NSApplicationDelegate, ObservableObject).

// ------------------------------------------------------------------------------------------------
// OLDER Code: Didn't work out...
// ------------------------------------------------------------------------------------------------
//  self.xcgLogger?.setup(level: .debug,
//                       showLogIdentifier: true,
//                       showFunctionName: true,
//                       showThreadName: true,
//                       showLevel: true,
//                       showFileNames: true,
//                       showLineNumbers: true,
//                       showDate: true,
//                       writeToFile: "",
//                       fileLevel: .debug)
//  self.xcgLogger?.setup(level: .debug,
//                       showLogIdentifier: true,
//                       showFunctionName: true,
//                       showThreadName: true,
//                       showLevel: true,
//                       showFileNames: true,
//                       showLineNumbers: true,
//                       showDate: true,
//                       writeToFile: "",
//                       fileLevel: .debug)
//  
//  self.xcgLogger?.setup(level:             .verbose,
//                        showLogIdentifier: true,
//                        showFunctionName:  true,
//                        showThreadName:    true,
//                        showLevel:         true,
//                        showFileNames:     true,
//                        showLineNumbers:   true,
//                        showDate:          true,
//                        writeToFile:       self.urlAppDelegateLogFilespec,
//                    //  writeToFile:       self.sLogFilespec,
//                    //  writeToFile:       "~/Documents/\(JustAXCGLoggerTest1AppDelegate.sApplicationName).log",
//                    //  writeToFile:       "~/Data/Documents/\(JustAXCGLoggerTest1AppDelegate.sApplicationName).log",
//                        fileLevel:         .verbose)
//
//      self.xcgLogger? = XCGLogger(identifier: "net.justmacapps.\(JustAXCGLoggerTest1AppDelegate.sApplicationName).advancedSysLogger",
//                                  includeDefaultDestinations: false)
//      self.xcgLogger? = XCGLogger(identifier: "net.justmacapps.\(JustAXCGLoggerTest1AppDelegate.sApplicationName).advancedSysLogger",
//                                  includeDefaultDestinations: true)
//
//      let xcgSystemDestination = AppleSystemLogDestination(identifier: "net.justmacapps.\(JustAXCGLoggerTest1AppDelegate.sApplicationName).advancedSysLogger.systemDestination")
//
//  //  xcgSystemDestination.outputLevel       = .debug
//      xcgSystemDestination.outputLevel       = .verbose
//  //  xcgSystemDestination.showLogIdentifier = false
//      xcgSystemDestination.showLogIdentifier = true
//      xcgSystemDestination.showFunctionName  = true
//      xcgSystemDestination.showThreadName    = true
//      xcgSystemDestination.showLevel         = true
//      xcgSystemDestination.showFileName      = true
//      xcgSystemDestination.showLineNumber    = true
//      xcgSystemDestination.showDate          = true
//
//      self.xcgLogger?.add(destination: xcgSystemDestination)
//
//      let xcgFileDestination = FileDestination(writeToFile: "~/Documents/\(JustAXCGLoggerTest1AppDelegate.sApplicationName).log", 
//                                               identifier:  "net.justmacapps.\(JustAXCGLoggerTest1AppDelegate.sApplicationName).advancedSysLogger.xcgFileDestination")
//
//      xcgFileDestination.outputLevel       = .verbose
//      xcgFileDestination.showLogIdentifier = true
//      xcgFileDestination.showFunctionName  = true
//      xcgFileDestination.showThreadName    = true
//      xcgFileDestination.showLevel         = true
//      xcgFileDestination.showFileName      = true
//      xcgFileDestination.showLineNumber    = true
//      xcgFileDestination.showDate          = true
//
//      // Process this destination in the background:
//
//      xcgFileDestination.logQueue = XCGLogger.logQueue
//
//      self.xcgLogger?.add(destination: xcgFileDestination)
//
//      self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' instance 'self.xcgLogger' has been created (to 2 destinations: System Console and File)...")
//
//      self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' FileDestination is writing to [\(String(describing: xcgFileDestination.writeToFileURL))]...")
// ------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------




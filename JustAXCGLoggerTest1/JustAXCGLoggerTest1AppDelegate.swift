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
        static let sClsVers        = "v1.0116"
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

    var bLogFilespecIsUsable:Bool                = false
    var sLogFilepathUrl:URL?                     = nil
    var sLogFilespecUrl:URL?                     = nil
    var sLogFilespec:String!                     = nil
    var sLogFilepath:String!                     = nil

    var xcgLogger:XCGLogger?                     = XCGLogger.default
//  var xcgLogger:XCGLogger?                     = nil

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

        self.cAppDelegateInitCalls += 1
        self.bLogFilespecIsUsable   = false

        do 
        {

        //  self.sLogFilepathUrl = try FileManager.default.url(for: .downloadsDirectory ,in: .userDomainMask ,appropriateFor: nil, create: true)
            self.sLogFilepathUrl = try FileManager.default.url(for: .documentDirectory ,in: .userDomainMask ,appropriateFor: nil, create: true)
            self.sLogFilespecUrl = self.sLogFilepathUrl?.appendingPathComponent(ClassInfo.sClsLogFilespec)
            self.sLogFilespec    = self.sLogFilespecUrl?.path
            self.sLogFilepath    = self.sLogFilepathUrl?.path

            print("'[\(String(describing: ClassInfo.sClsDisp))].init(...)' - ...'self.sLogFilespec' (computed) is [\(String(describing: self.sLogFilespec))]...")
            print("'[\(String(describing: ClassInfo.sClsDisp))].init(...)' - ...'self.sLogFilepath' (resolved #2) is [\(String(describing: self.sLogFilepath))]...")

            try FileManager.default.createDirectory(atPath: sLogFilepath, withIntermediateDirectories: true, attributes: nil)

            let sContents = "\(sCurrMethodDisp) Method Invoked - 'sApplicationName' is [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)]..."

            try sContents.write(toFile: self.sLogFilespec, atomically:true, encoding:String.Encoding.utf8)

            self.bLogFilespecIsUsable = true

        }
        catch
        {

            self.bLogFilespecIsUsable = false

            print("'[\(String(describing: ClassInfo.sClsDisp))].appInit(...)' - Failed to create the 'path' of [.documentDirectory] - Error: \(error)...")

        //  return

        }
        
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
        
        self.xcgLogger?.setup(level:             .verbose,
                              showLogIdentifier: true,
                              showFunctionName:  true,
                              showThreadName:    true,
                              showLevel:         true,
                              showFileNames:     true,
                              showLineNumbers:   true,
                              showDate:          true,
                              writeToFile:       self.sLogFilespecUrl,
                          //  writeToFile:       self.sLogFilespec,
                          //  writeToFile:       "~/Documents/\(JustAXCGLoggerTest1AppDelegate.sApplicationName).log",
                          //  writeToFile:       "~/Data/Documents/\(JustAXCGLoggerTest1AppDelegate.sApplicationName).log",
                              fileLevel:         .verbose)

//      self.xcgLogger? = XCGLogger(identifier: "net.justmacapps.\(JustAXCGLoggerTest1AppDelegate.sApplicationName).advancedSysLogger",
//                                  includeDefaultDestinations: false)
//      self.xcgLogger? = XCGLogger(identifier: "net.justmacapps.\(JustAXCGLoggerTest1AppDelegate.sApplicationName).advancedSysLogger",
//                                  includeDefaultDestinations: true)

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

        // Add basic app info, version info etc, to the start of the logs:

        self.xcgLogger?.logAppDetails()

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Invoked - 'sApplicationName' is [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)]...")

        self.xcgLogger?.info("\(sCurrMethodDisp) AppDelegate is starting...")
        self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' instance 'self.xcgLogger' is being used (default instance)...")
        
        let listXCGLoggerDestinations = self.xcgLogger?.destinations
        
        self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' (default) instance has these destinations (\(listXCGLoggerDestinations!.count)): [\(String(describing: listXCGLoggerDestinations))]...")
        
        for index in 0 ..< (listXCGLoggerDestinations!.count) 
        {

        //  listXCGLoggerDestinations?[index].outputLevel = outputLevel

            self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' (default) instance destination #(\(index)) TYPE is [\(String(describing: type(of: listXCGLoggerDestinations?[index])))]...")
            self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' (default) instance destination #(\(index)) 'is' FileDestination [\(String(describing: (listXCGLoggerDestinations?[index] is FileDestination)))]...")
            self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' (default) instance destination #(\(index)) is [\(String(describing: listXCGLoggerDestinations?[index]))]...")

            if ((listXCGLoggerDestinations?[index] is FileDestination) == true)
            {

                let xcgFileDestination = listXCGLoggerDestinations?[index] as! FileDestination

                self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' FileDestination is writing to [\(String(describing: xcgFileDestination.writeToFileURL))]...")

            }

        }
        
//      self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' instance 'self.xcgLogger' has been created (to 2 destinations: System Console and File)...")
//
//      self.xcgLogger?.info("\(sCurrMethodDisp) XCGLogger 'log' FileDestination is writing to [\(String(describing: xcgFileDestination.writeToFileURL))]...")

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:"\(sCurrMethodDisp)<>\(self.cAppDelegateInitCalls)")

        // Exit:

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting - 'sApplicationName' is [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)]...")

        return

    }   // End of init().
        
    func initAppDelegateTraceLog(initappdelegatetracelogtag:String = "-unknown-")
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        if (self.bAppDelegateTraceLogInitRequired == true)
        {
            
        //  let logger = Logger(label: "net.justmacapps.\(JustAXCGLoggerTest1AppDelegate.sApplicationName)")
        //  
        //  logger.info("\(sCurrMethodDisp) AppDelegate is starting - SwiftLog 'logger' instance has been created...")

            self.xcgLogger?.info("\(sCurrMethodDisp) AppDelegate is starting - parameter 'initappdelegatetracelogtag' is [\(initappdelegatetracelogtag)]...")

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

    func getAppDelegateApplicationTitle() -> String
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        if (self.bAppTitleSetupRequired == true)
        {

            self.xcgLogger?.info("\(sCurrMethodDisp) Setting up the Application 'title'...")

            self.initAppDelegateTraceLog(initappdelegatetracelogtag:sCurrMethodDisp)

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

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:sCurrMethodDisp)

        self.xcgLogger?.info("\(sCurrMethodDisp) Invoked - 'aNotification' is [\(aNotification)] - 'sApplicationName' is [\(JustAXCGLoggerTest1AppDelegate.sApplicationName)]...")

        // Exit:

        self.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting...")

    }   // End of func applicationWillFinishLaunching().

    func applicationDidFinishLaunching(_ aNotification: Notification) 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        let cArgs              = Int(CommandLine.argc)

        self.initAppDelegateTraceLog(initappdelegatetracelogtag:sCurrMethodDisp)

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

}   // End of class JustAXCGLoggerTest1AppDelegate(NSObject, NSApplicationDelegate, ObservableObject).


//
//  JmUserDefaults.swift
//  JmUtils_Library
//
//  Created by JustMacApps.net on 06/11/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import Cocoa
import Foundation
import SwiftUI

class JmUserDefaults: NSObject
{

    struct ClassInfo
    {
        
        static let sClsId        = "JmUserDefaults"
        static let sClsVers      = "v1.0503"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = true
        static let bClsFileLog   = true
        
    }

    // Standard UserDefaults object:

    let userDefaults           = UserDefaults.standard

    // Misc:

    let bClsTraceInternal:Bool = false

    // Misc:

    let appDelegate:JustAXCGLoggerWithLogonTest2AppDelegate
                               = JustAXCGLoggerWithLogonTest2AppDelegate.ClassSingleton.appDelegate!

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
        asToString.append("'userDefaults': [\(String(describing: self.userDefaults))],")
        asToString.append("],")
        asToString.append("[")
        asToString.append("'bClsTraceInternal': [\(self.bClsTraceInternal)],")
        asToString.append("'appDelegate': [\(self.appDelegate.toString())]")
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

        self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Method Invoked - 'appDelegate' is [\(self.appDelegate)]...")
        self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting - 'appDelegate' is [\(self.appDelegate)]...")

        return

    }   // End of init().

    func getObjectForKey(forKey:String = "") -> Any?
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"'"

        self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Method Invoked - 'appDelegate' is [\(self.appDelegate)] - 'forKey' is [\(forKey)]...")

        let sSuppliedForKey:String = forKey

        if (sSuppliedForKey.count < 1)
        {

            self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Supplied 'forKey' value is an 'empty' string - this is required - Error!")
            self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting - 'appDelegate' is [\(self.appDelegate)] - 'sSuppliedForKey' was None or empty - Error!...")

            return nil

        }

        let objUserDefaults:Any? = self.userDefaults.object(forKey:sSuppliedForKey)

        self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) The 'objUserDefaults' value returned from UserDefaults for the key of [\(sSuppliedForKey)] is [\(String(describing: objUserDefaults))]...")
        self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting - 'appDelegate' is [\(self.appDelegate)] - 'sSuppliedForKey' is [\(sSuppliedForKey)]...")

        return objUserDefaults

    }   // End of getObjectForKey().

    func setObjectForKey(_ keyValue:Any?, forKey:String = "")
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"'"

        self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Method Invoked - 'appDelegate' is [\(self.appDelegate)] - 'forKey' is [\(forKey)]...")

        let sSuppliedForKey:String = forKey

        if (sSuppliedForKey.count < 1)
        {

            self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Supplied 'forKey' value is an 'empty' string - this is required - Error!")
            self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting - 'appDelegate' is [\(self.appDelegate)] - 'sSuppliedForKey' was None or empty - Error!...")

            return

        }

        self.userDefaults.set(keyValue, forKey:sSuppliedForKey)

        self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) The Supplied 'kayValue' object has been set into UserDefaults for the key of [\(sSuppliedForKey)] as [\(String(describing: keyValue))]...")
        self.appDelegate.xcgLogger?.info("\(sCurrMethodDisp) Method Exiting - 'appDelegate' is [\(self.appDelegate)] - 'sSuppliedForKey' is [\(sSuppliedForKey)]...")

        return

    }   // End of setObjectForKey().

}   // End of class JmUserDefaults(NSObject).


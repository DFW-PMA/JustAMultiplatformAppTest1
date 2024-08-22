//
//  JmXcodeBuildSettings.swift
//  JmUtils_Library
//
//  Created by Daryl Cox on 08/22/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import Foundation

// Implementation class to handle access to Xcode (.xcodeproj) 'Build' Setting(s).

public class JmXcodeBuildSettings
{

    struct ClassInfo
    {

        static let sClsId        = "JmXcodeBuildSettings"
        static let sClsVers      = "v1.0105"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = false
        static let bClsFileLog   = false

    }   // End of struct ClassInfo.

    // App Data field(s):

    static var jmAppVersionAndBuildNumber:String
    {

        getAppVersionAndBuildNumber()

    }

    static var jmAppCopyright:String
    {

    //  getAppCopyright()
        getAppInfoPlistString(for: "NSHumanReadableCopyright")

    }

    static var jmAppJmaUserSetting1:String
    {

        getAppInfoPlistString(for: "JMA_USER_SETTING_1")

    }

    class public func toString() -> String
    {

        var asToString:[String] = Array()

        asToString.append("[")
        asToString.append("[")
        asToString.append("'sClsId': [\(ClassInfo.sClsId)],")
        asToString.append("'sClsVers': [\(ClassInfo.sClsVers)],")
        asToString.append("'sClsDisp': [\(ClassInfo.sClsDisp)],")
        asToString.append("'sClsCopyRight': [\(ClassInfo.sClsCopyRight)],")
        asToString.append("'bClsTrace': [\(ClassInfo.bClsTrace)],")
        asToString.append("'bClsFileLog': [\(ClassInfo.bClsFileLog)]")
        asToString.append("],")
        asToString.append("[")
        asToString.append("'jmAppVersionAndBuildNumber': [\(self.jmAppVersionAndBuildNumber)],")
        asToString.append("'jmAppCopyright': [\(self.jmAppCopyright)],")
        asToString.append("'jmAppJmaUserSetting1': [\(self.jmAppJmaUserSetting1)],")
        asToString.append("],")
        asToString.append("]")

        let sContents:String = "{"+(asToString.joined(separator: ""))+"}"

        return sContents

    }   // End of class public func toString().

    class public func getAppVersionAndBuildNumber() -> String 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        xcgLogMsg("\(sCurrMethodDisp) Invoked...")

    //  let sAppVersionNumber:String         = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? "-N/A-"
    //  let sAppBuildNumber:String           = (Bundle.main.infoDictionary?["CFBundleVersion"]            as? String) ?? "-N/A-"
        let sAppVersionNumber:String         = getAppInfoPlistString(for: "CFBundleShortVersionString")
        let sAppBuildNumber:String           = getAppInfoPlistString(for: "CFBundleVersion")
        let sAppVersionAndBuildNumber:String = "Version v\(sAppVersionNumber) (\(sAppBuildNumber))"

        // Exit:

        xcgLogMsg("\(sCurrMethodDisp) Exiting - 'sAppVersionAndBuildNumber' is [\(sAppVersionAndBuildNumber)]...")

        return sAppVersionAndBuildNumber

    }   // End of class public func getAppVersionAndBuildNumber().

    class public func getAppCopyright() -> String 
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

    //  let sAppCopyRight:String = (Bundle.main.infoDictionary?["NSHumanReadableCopyright"] as? String) ?? "-N/A-"
        let sAppCopyRight:String = getAppInfoPlistString(for: "NSHumanReadableCopyright")

        // Exit:

        xcgLogMsg("\(sCurrMethodDisp) Exiting - 'sAppCopyRight' is [\(sAppCopyRight)]...")

        return sAppCopyRight

    }   // End of class public func getAppCopyright().

    class public func getAppInfoPlistString(for key:String) -> String
    {

        return (Bundle.main.infoDictionary?[key] as? String) ?? "-N/A-"

    }   // End of class public func getAppInfoPlistString(for key:).

    class private func xcgLogMsg(_ sMessage:String)
    {

    //  self.appDelegate.xcgLogMsg("\(sMessage)")
        print("\(sMessage)")

        // Exit:

        return

    }   // End of class private func xcgLogMsg().

}   // End of public class JmXcodeBuildSettings.


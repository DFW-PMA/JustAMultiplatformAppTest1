//
//  JmAppMetricKitManager.swift
//  JmUtils_Library
//
//  Created by Daryl Cox on 10/02/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import Foundation
import MetricKit

// Implementation class to handle access to the Apple MetricKit.

public class JmAppMetricKitManager: NSObject, MXMetricManagerSubscriber
{

    struct ClassInfo
    {

        static let sClsId        = "JmAppMetricKitManager"
        static let sClsVers      = "v1.0105"
        static let sClsDisp      = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace     = false
        static let bClsFileLog   = false

    }   // End of struct ClassInfo.

    // App Data field(s):

    private var jmMetricManager:MXMetricManager            = MXMetricManager.shared

            var jmAppDelegateVisitor:JmAppDelegateVisitor? = nil
                                                     // 'jmAppDelegateVisitor' MUST remain declared this way
                                                     // as having it reference the 'shared' instance of 
                                                     // JmAppDelegateVisitor causes a circular reference
                                                     // between the 'init()' methods of the 2 classes...

    override init()
    {
        
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        super.init()

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - 'jmMetricManager' is [\(jmMetricManager)] - 'jmAppDelegateVisitor' is [\(String(describing: self.jmAppDelegateVisitor))]...")

        // Add 'self' to the MXMetricManager as a 'subscriber'...

        self.jmMetricManager.add(self)

        self.xcgLogMsg("\(sCurrMethodDisp) Added 'self' to 'jmMetricManager' instance as a 'subscriber'...")

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'jmMetricManager' is [\(jmMetricManager)] - 'jmAppDelegateVisitor' is [\(String(describing: self.jmAppDelegateVisitor))]...")

        return

    }   // End of override init().

    private func xcgLogMsg(_ sMessage:String)
    {

        if (self.jmAppDelegateVisitor != nil)
        {

            if (self.jmAppDelegateVisitor!.bAppDelegateVisitorLogFilespecIsUsable == true)
            {

                self.jmAppDelegateVisitor!.xcgLogMsg(sMessage)

            }
            else
            {

                print("\(sMessage)")

            }

        }
        else
        {

            print("\(sMessage)")

        }

        // Exit:

        return

    }   // End of private func xcgLogMsg().

    public func toString() -> String
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
        asToString.append("'jmMetricManager': [\(self.jmMetricManager)],")
        asToString.append("],")
        asToString.append("]")

        let sContents:String = "{"+(asToString.joined(separator: ""))+"}"

        return sContents

    }   // End of public func toString().

    // (Call-back) Method to set the jmAppDelegateVisitor instance...

    public func setJmAppDelegateVisitorInstance(jmAppDelegateVisitor:JmAppDelegateVisitor)
    {
        
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "(.swift):'"+sCurrMethod+"'"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - supplied parameter 'jmAppDelegateVisitor' is [\(jmAppDelegateVisitor)]...")

        self.jmAppDelegateVisitor = jmAppDelegateVisitor
    
        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'self.jmAppDelegateVisitor' is [\(String(describing: self.jmAppDelegateVisitor))]...")
    
        return

    } // End of public func setJmAppDelegateVisitorInstance().

    // Method(s) to 'receive' and 'pause' Report(s)...

    public func receiveReports()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Add 'self' (again) to the MXMetricManager as a 'subscriber' to 'receive' Report(s)...

        self.jmMetricManager.add(self)

        self.xcgLogMsg("\(sCurrMethodDisp) Added 'self' to 'jmMetricManager' instance as a 'subscriber' (again) to 'receive' report(s)...")

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of public func receiveReports().

    public func pauseReports()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Remove 'self' from the MXMetricManager as a 'subscriber' to 'pause' Report(s)...

        self.jmMetricManager.remove(self)

        self.xcgLogMsg("\(sCurrMethodDisp) Removed 'self' from 'jmMetricManager' instance as a 'subscriber' to 'pause' report(s)...")

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of public func pauseReports().

    // Method(s) to 'receive' and handle MXMetricManager 'payload(s)'...

#if os(iOS)

    // MXMetricPayload is ONLY available under Mac Catalyst 13.1+ (not MacOS):

    public func didReceive(_ payloads: [MXMetricPayload])
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Handle the payload list by looping to convert the item(s) into string(s) to be able to 'upload'...

        var listPayloadAttachments:[String] = []

        if (payloads.count > 0)
        {

            for payload in payloads
            {

                listPayloadAttachments.append(payload.jsonRepresentation().base64EncodedString())

            }

            self.xcgLogMsg("\(sCurrMethodDisp) Supplied 'payload' list was converted to 'upload' string(s) as [\(listPayloadAttachments)]...")

            // ...this is where we'd 'upload' this data and email it...

        }
        else
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Supplied 'payload' list was Empty - no action was taken...")

        }

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of public func didReceive(_ payloads: [MXMetricPayload]).

#endif

    public func didReceive(_ payloads: [MXDiagnosticPayload])
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Handle the payload list by looping to convert the item(s) into string(s) to be able to 'upload'...

        var listPayloadAttachments:[String] = []

        if (payloads.count > 0)
        {

            for payload in payloads
            {

                listPayloadAttachments.append(payload.jsonRepresentation().base64EncodedString())

            }

            self.xcgLogMsg("\(sCurrMethodDisp) Supplied 'payload' list was converted to 'upload' string(s) as [\(listPayloadAttachments)]...")

            // ...this is where we'd 'upload' this data and email it...

        }
        else
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Supplied 'payload' list was Empty - no action was taken...")

        }

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of public func didReceive(_ payloads: [MXDiagnosticPayload]).

}   // End of public class JmAppMetricKitManager.

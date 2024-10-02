//
//  JmObjCSwiftEnvBridge.swift
//  JustAMultiplatformAppTest1
//
//  Created by Daryl Cox on 07/30/2024.
//  Copyright © JustMacApps 2023-2024. All rights reserved.
//

import Foundation
import SwiftUI
import XCGLogger

@available(iOS 14.0, *)
@objc(JmObjCSwiftEnvBridge)
@objcMembers
public class JmObjCSwiftEnvBridge: NSObject
{
    
    struct ClassInfo
    {
        
        static let sClsId          = "JmObjCSwiftEnvBridge"
        static let sClsVers        = "v1.1001"
        static let sClsDisp        = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    // Class 'singleton' instance:

    @objc(sharedObjCSwiftEnvBridge)
    static let sharedObjCSwiftEnvBridge                    = JmObjCSwiftEnvBridge()

    // Various App field(s):

    private var bInternalTest:Bool                         = true

    private var cJmObjCSwiftEnvBridgeMethodCalls:Int       = 0

            var jmAppDelegateVisitor:JmAppDelegateVisitor? = nil
                                                             // 'jmAppDelegateVisitor' MUST remain declared this way
                                                             // as having it reference the 'shared' instance of 
                                                             // JmAppDelegateVisitor causes a circular reference
                                                             // between the 'init()' methods of the 2 classes...

    private override init()
    {
        
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "(.swift):'"+sCurrMethod+"'"
        
        super.init()
      
        self.cJmObjCSwiftEnvBridgeMethodCalls += 1
      
        self.xcgLogMsg("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Invoked...")
      
        // Exit:
      
        self.xcgLogMsg("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Exiting...")

        return

    }   // End of init().
    
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

    public func setJmAppDelegateVisitorInstance(jmAppDelegateVisitor:JmAppDelegateVisitor)
    {
        
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "(.swift):'"+sCurrMethod+"'"
        
        self.cJmObjCSwiftEnvBridgeMethodCalls += 1
    
        self.xcgLogMsg("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Invoked - supplied parameter 'jmAppDelegateVisitor' is [\(jmAppDelegateVisitor)]...")

        self.jmAppDelegateVisitor = jmAppDelegateVisitor
    
        // Exit:

        self.xcgLogMsg("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Exiting - 'self.jmAppDelegateVisitor' is [\(String(describing: self.jmAppDelegateVisitor))]...")
    
        return

    } // End of public func setJmAppDelegateVisitorInstance().

    class public func sharedEnvBridge() -> JmObjCSwiftEnvBridge
    {
        
        return sharedObjCSwiftEnvBridge
        
    }   // End of class public func sharedEnvBridge().

    @objc public func jmLogMsg(_ message:NSString)
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "(.swift):'"+sCurrMethod+"'"

        self.cJmObjCSwiftEnvBridgeMethodCalls += 1

        if (bInternalTest == false)
        {

            self.xcgLogMsg(message as String)

        }
        else
        {

            self.xcgLogMsg("-------------------------------------------------------------------------------------------------------------")
            self.xcgLogMsg("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Invoked - Swift code has been called with a parameter 'message' of [\(message)]...")
            self.xcgLogMsg("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' JmObjCSwiftEnvBridge 'self' is [\(self)]...")
            self.xcgLogMsg("-------------------------------------------------------------------------------------------------------------")

            // Exit:

            self.xcgLogMsg("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Exiting...")

        }

        return

    }   // End of @objc public func jmLogMsg().

}   // End of class JmObjCSwiftEnvBridge(NSObject).


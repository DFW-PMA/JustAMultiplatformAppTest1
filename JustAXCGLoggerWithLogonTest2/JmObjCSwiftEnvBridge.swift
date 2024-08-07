//
//  JmObjCSwiftEnvBridge.swift
//  JustAXCGLoggerWithLogonTest2
//
//  Created by Daryl Cox on 07/30/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
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
        static let sClsVers        = "v1.0203"
        static let sClsDisp        = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight   = "Copyright (C) DFW-PMA 2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    // Class 'singleton' instance:

    @objc(sharedObjCSwiftEnvBridge)
    static let sharedObjCSwiftEnvBridge = JmObjCSwiftEnvBridge()
//  static let sharedObjCSwiftEnvBridge:JmObjCSwiftEnvBridge = JmObjCSwiftEnvBridge()

    // Various App field(s):

    var cJmObjCSwiftEnvBridgeMethodCalls:Int = 0

    var xcgLogger:XCGLogger?                 = nil

    private override init()
    {
        
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "(.swift):'"+sCurrMethod+"'"
        
        super.init()

        self.cJmObjCSwiftEnvBridgeMethodCalls += 1
        self.xcgLogger                         = nil

        print("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Invoked ...")

    }   // End of init().
    
    class public func sharedEnvBridge() -> JmObjCSwiftEnvBridge
    {
        
        return sharedObjCSwiftEnvBridge
        
    }   // End of class public func sharedEnvBridge().

//  convenience init(xcgLogger:XCGLogger)
    public func setXCGLoggerInstance(xcgLogger:XCGLogger)
    {
        
        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "(.swift):'"+sCurrMethod+"'"
        
    //  self.init()
        
        self.cJmObjCSwiftEnvBridgeMethodCalls += 1

        print("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Invoked - parameter 'xcgLogger' is [\(String(describing: xcgLogger))]...")

        self.xcgLogger = xcgLogger

        if ((self.xcgLogger) != nil) 
        {

            self.xcgLogger?.info("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Exiting - parameter 'xcgLogger' was [\(String(describing: xcgLogger))] and 'self.xcgLogger' is [\(String(describing: self.xcgLogger))]...")

        }
        else
        {

            print("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Exiting - parameter 'xcgLogger' was [\(String(describing: xcgLogger))] and 'self.xcgLogger' is [\(String(describing: self.xcgLogger))] but is Null - Error!")

        }

    } // End of public func setXCGLoggerInstance().
//  } // End of (convenience) init().
    
    @objc public func jmLogMsg(_ message:NSString)
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "(.swift):'"+sCurrMethod+"'"

        self.cJmObjCSwiftEnvBridgeMethodCalls += 1

        if ((self.xcgLogger) != nil) 
        {

            self.xcgLogger?.info("-------------------------------------------------------------------------------------------------------------")
            self.xcgLogger?.info("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Swift code has been called with a parameter 'message' of [\(message)]...")
            self.xcgLogger?.info("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' JmObjCSwiftEnvBridge 'self' is [\(self)]...")
            self.xcgLogger?.info("-------------------------------------------------------------------------------------------------------------")

        }
        else
        {

            print("-------------------------------------------------------------------------------------------------------------")
            print("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Swift code has been called with a parameter 'message' of [\(message)]...")
            print("\(ClassInfo.sClsDisp)\(sCurrMethodDisp)#(\(self.cJmObjCSwiftEnvBridgeMethodCalls))' Exiting - 'self.xcgLogger' is [\(String(describing: self.xcgLogger))] but is Null - Error!")
            print("-------------------------------------------------------------------------------------------------------------")

        }

        return

    }   // End of jmLogMsg().

}   // End of class JmObjCSwiftEnvBridge.


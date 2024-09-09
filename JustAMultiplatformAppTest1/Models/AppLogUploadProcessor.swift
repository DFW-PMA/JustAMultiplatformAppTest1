//
//  AppLogUploadProcessor.swift
//  JustAMultiplatformAppTest1
//
//  Created by Daryl Cox on 08/11/2024.
//  Copyright (c) JustMacApps 2018-2024. All rights reserved.
//

import Foundation

class AppLogUploadProcessor: NSObject
{

    struct ClassInfo
    {

        static let sClsId          = "AppLogUploadProcessor"
        static let sClsVers        = "v1.0103"
        static let sClsDisp        = sClsId+".("+sClsVers+"): "
        static let sClsCopyRight   = "Copyright (c) JustMacApps 2018-2024. All rights reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true

    }

    // App Data field(s):

    var jmAppDelegateVisitor:JmAppDelegateVisitor = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor
    
    var id:String                                 = ""
    var appLogUploadItem:AppLogUploadItem?        = nil

    var restURLEndpoint:RestURLEndpoint?          = nil
    var restURLProcessor:RestURLProcessor?        = nil
    var restURLResponse:RestURLResponse?          = nil

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
        asToString.append("'id': [\(String(describing: self.id))],")
        asToString.append("'appLogUploadItem': [\(String(describing: self.appLogUploadItem))],")
        asToString.append("'restURLEndpoint': [\(String(describing: self.restURLEndpoint))],")
        asToString.append("'restURLProcessor': [\(String(describing: self.restURLProcessor))],")
        asToString.append("'restURLResponse': [\(String(describing: self.restURLResponse))],")
        asToString.append("]")

        let sContents:String = "{"+(asToString.joined(separator: ""))+"}"

        return sContents

    } // End of (open) func toString().

    override init()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        super.init()

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        self.id               = UUID().uuidString
        self.restURLProcessor = RestURLProcessor()

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    } // End of (override) init().

    private func xcgLogMsg(_ sMessage:String)
    {

        if (self.jmAppDelegateVisitor.bAppDelegateVisitorLogFilespecIsUsable == true)
        {

            self.jmAppDelegateVisitor.xcgLogMsg(sMessage)

        }
        else
        {

            print("\(sMessage)")

        }

        // Exit:

        return

    }   // End of private func xcgLogMsg().

    public func postAppLogUploadViaRestAPIItem() -> AppLogUploadItem?
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        self.appLogUploadItem = nil

        if (self.restURLProcessor == nil)
        {

            self.restURLProcessor = RestURLProcessor()

        }

        if (self.restURLEndpoint == nil)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) 'self.restURLEndpoint' is Nil - Error!")

            // Exit:

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

            return nil

        }

        let bPostAppLogUploadOk = self.postAppLogUploadViaRestAPI()

        if (bPostAppLogUploadOk == false)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Invocation of 'self.postAppLogUploadViaRestAPI()' returned [\(bPostAppLogUploadOk)] - Error!")

            // Exit:

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

            return nil

        }

        self.xcgLogMsg("\(sCurrMethodDisp) Returned 'self.restURLResponse' is [\(String(describing: self.restURLResponse))]...")

        self.appLogUploadItem = AppLogUploadItem()

        self.appLogUploadItem?.title       = "AppLogUpload at [...]"
        self.appLogUploadItem?.completed   = true
        self.appLogUploadItem?.urlResponse = self.restURLResponse!

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - returned 'self.appLogUploadItem' is [\(String(describing: self.appLogUploadItem))]...")

        return self.appLogUploadItem

    } // End of public func postAppLogUploadViaRestAPIItem().

    func postAppLogUploadViaRestAPI() -> Bool
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        let asJsonHeaders =
        [
            "Content-Type":  "application/json;v1.0 / 2.0",
        //  "Authorization": "Bearer \(self.restURLEndpoint!.sURLAccessToken)",
            "cxOrigin":      "\(AppGlobalInfo.sGlobalInfoAppId)",
            "cache-control": "no-cache"
        ]

        self.restURLProcessor!.restURLData                  = RestURLData()
        self.restURLProcessor!.restURLData!.restURLEndpoint = self.restURLEndpoint
    //  self.restURLProcessor!.restURLData!.sHttpURI        = "points/\(self.currLatitude),\(self.currLongitude)"
        self.restURLProcessor!.restURLData!.sHttpURI        = "/dfwpma/file_uploads"
        self.restURLProcessor!.restURLData!.sHttpParams     = ""

        _ = self.restURLProcessor!.restURLData!.generateHttpURL()

        let postJsonRequest = NSMutableURLRequest(url:             NSURL(string: self.restURLProcessor!.restURLData!.sHttpGeneratedURL)! as URL,
                                                  cachePolicy:     .reloadIgnoringLocalCacheData,
                                                  timeoutInterval: 30.0)

        postJsonRequest.httpMethod          = "POST"
        postJsonRequest.allHTTPHeaderFields = asJsonHeaders

        self.restURLProcessor!.jsonRequest               = postJsonRequest
        self.restURLProcessor!.aiJsonResponseStatusCodes = [200]

        self.xcgLogMsg("\(sCurrMethodDisp) Issueing a URL 'request' to [\(self.restURLProcessor!)]...")

        self.restURLResponse = self.restURLProcessor!.handleURLRequestWithJsonResponse(reset: false)

        if (self.restURLResponse!.bRestURLQueryOk == false)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) The JSON Request 'postJsonRequest' [\(postJsonRequest)] failed - 'restURLResponse' was [\(self.restURLResponse!)] - Error!")

            return false

        }

        if (self.restURLProcessor!.adJsonResult.count > 0)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) The 'deserialized' JSON result array 'adJsonResult' contains (\(self.restURLProcessor!.adJsonResult.count)) lines...")

            for (i, dictJsonResult) in self.restURLProcessor!.adJsonResult.enumerated()
            {

                var j            = 0
            //  var idProject    = 0
            //  var sProjectName = ""
            //  var sJsonName    = ""

                for (dictJsonKey, dictJsonValue) in dictJsonResult
                {

                    j += 1

                    self.xcgLogMsg("\(sCurrMethodDisp) JSON result #(\(i + 1):\(j)): Key [\(dictJsonKey)], Value [\(dictJsonValue)]...")

                //  if (dictJsonKey as! String == "id")
                //  {
                //
                //  //  idProject = dictJsonValue as! String
                //
                //      if (dictJsonValue is Int)
                //      {
                //
                //          idProject    = dictJsonValue as! Int
                //
                //      }
                //
                //      if (dictJsonValue is Int)
                //      {
                //
                //          sProjectName = dictJsonValue as! String
                //
                //      }
                //
                //  }
                //
                //  if (dictJsonKey as! String == "name")
                //  {
                //
                //      sJsonName = dictJsonValue as! String
                //
                //  }

                }

            }

        }

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return true

    } // End of func postAppLogUploadViaRestAPI().

} // End of class AppLogUploadProcessor.


//
//  MultipartRequestDriver.swift
//  JustAMultipartRequestTest1
//
//  Created by JustMacApps.net on 09/10/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import Foundation
import SwiftUI

class MultipartRequestDriver: NSObject
{

    struct ClassInfo
    {
        
        static let sClsId          = "MultipartRequestDriver"
        static let sClsVers        = "v1.0310"
        static let sClsDisp        = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    // App Data field(s):

    private var bInternalTest:Bool                         = false

                                                             // For 'test':
    private var dictUserData:[String:String]               = ["firstName": "John",
                                                              "lastName":  "Doe"
                                                             ]

    private var multipartRequestInfo:MultipartRequestInfo? = nil

    public  var urlResponse:HTTPURLResponse?               = nil
    public  var urlResponseData:Data?                      = nil

    override init()
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"
        
        super.init()
        
        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Exit...

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of override init().

    private func xcgLogMsg(_ sMessage:String)
    {

    //  if (self.jmAppDelegateVisitor.bAppDelegateVisitorLogFilespecIsUsable == true)
    //  {
    //
    //      self.jmAppDelegateVisitor.xcgLogMsg(sMessage)
    //
    //  }
    //  else
    //  {
    //
    //      print("\(sMessage)")
    //
    //  }

        print("\(sMessage)")

        // Exit:

        return

    }   // End of private func xcgLogMsg().

    public func executeMultipartRequest(multipartRequestInfo:MultipartRequestInfo? = nil)
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Process the Multipart Request on a background thread:

        let dispatchGroup = DispatchGroup()

        do
        {

            dispatchGroup.enter()

            let dispatchQueue = DispatchQueue(label: "MultipartRequestBackgroundThread", qos: .userInitiated)

            dispatchQueue.async
            {

                self.xcgLogMsg("\(sCurrMethodDisp) Calling 'processMultipartRequest()' with a 'multipartRequestInfo' of [\(String(describing: multipartRequestInfo))]...")
                
                Task
                {
                    
                    await self.processMultipartRequest(multipartRequestInfo:multipartRequestInfo)
                    
                }

                self.xcgLogMsg("\(sCurrMethodDisp) Called  'processMultipartRequest()' with a 'multipartRequestInfo' of [\(String(describing: multipartRequestInfo))]...")

            //  let jsAppDelegate:AppDelegate? = AppDelegate.ClassSingleton.jsAppDelegate
            //
            //  if (jsAppDelegate != nil)
            //  {
            //
            //      dispatchGroup.notify(queue: DispatchQueue.main, execute:
            //      {
            //    
            //          jsAppDelegate!.updateAppDelegateDisplay(sAppDelegateMessage:"Search <query> 'cache(s)' refreshed in the background with a total of (\(cMovieSearchTotalCacheItems)) item(s)...")
            //    
            //      })
            //
            //  }

            }

            dispatchGroup.leave()

        }

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of public func executeMultipartRequest().

    public func processMultipartRequest(multipartRequestInfo:MultipartRequestInfo? = nil) async
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

        // Determine if this is a 'test' or not:

        self.bInternalTest = false

        if (multipartRequestInfo == nil)
        {

            self.bInternalTest        = true
            self.multipartRequestInfo = nil

        }
        else
        {

            self.bInternalTest        = false
            self.multipartRequestInfo = multipartRequestInfo

        }

        // Create the Multipart 'request':

        var multipart = MultipartRequest()

        if (self.multipartRequestInfo == nil)
        {

            self.bInternalTest                               = true
            self.multipartRequestInfo                        = MultipartRequestInfo()

            self.multipartRequestInfo?.bAppZipSourceToUpload = false
            self.multipartRequestInfo?.sAppUploadURL         = ""                       // "" takes the Upload URL 'default'...
            self.multipartRequestInfo?.sAppUploadNotify      = "dcox@justmacapps.org"
            self.multipartRequestInfo?.sAppSourceFilespec    = "test1.txt"
            self.multipartRequestInfo?.sAppSourceFilename    = "test1.txt"
            self.multipartRequestInfo?.sAppZipFilename       = "test1.zip"
            self.multipartRequestInfo?.sAppSaveAsFilename    = "test1.data"
            self.multipartRequestInfo?.sAppFileMimeType      = "text/plain"
            self.multipartRequestInfo?.dataAppFile           = "test1-text-data".data(using:.utf8)
            
        }

        if (self.multipartRequestInfo?.sAppUploadURL == nil ||
            (self.multipartRequestInfo?.sAppUploadURL.count)! < 1)
        {

            self.multipartRequestInfo?.sAppUploadURL = "http://localhost/dfwpma/file_uploads"
        //  self.multipartRequestInfo?.sAppUploadURL = "http://justmacapps.net/dfwpma/file_uploads"

        }

        if (self.bInternalTest == true)
        {

            for userItem in self.dictUserData
            {

                multipart.add(key:userItem.key, value:userItem.value)

            }

        }

        multipart.add(key:          "file",
                      fileName:     self.multipartRequestInfo!.sAppSourceFilename,
                      fileMimeType: self.multipartRequestInfo!.sAppFileMimeType,
                      fileData:     (self.multipartRequestInfo?.dataAppFile)!)

        // Create a regular HTTP URL request & use multipart components:

        let url     = URL(string:self.multipartRequestInfo!.sAppUploadURL)!
        var request = URLRequest(url:url)

        request.httpMethod     = "POST"
        request.httpBody       = multipart.httpBody

        let listRequestHeaders =
        [
        //  "Content-Type":      "multipart/form-data; boundary=\(sFormBoundary)",
            "appOrigin":         "\(AppGlobalInfo.sGlobalInfoAppId)",
            "appUploadNotify":   self.multipartRequestInfo!.sAppUploadNotify,
            "appSourceFilespec": self.multipartRequestInfo!.sAppSourceFilespec,
            "appSourceFilename": self.multipartRequestInfo!.sAppSourceFilename,
            "appZipFilename":    self.multipartRequestInfo!.sAppZipFilename,
            "appSaveAsFilename": self.multipartRequestInfo!.sAppSaveAsFilename,
            "appFileMimeType":   self.multipartRequestInfo!.sAppFileMimeType,
            "Accept":            "*/*",
        //  "accept-encoding":   "gzip, deflate",
            "cache-control":     "no-cache"
        ]

        request.allHTTPHeaderFields = listRequestHeaders

        request.setValue(multipart.httpContentTypeHeaderValue, forHTTPHeaderField:"Content-Type")

        // Call URLSession with the 'request':

        var sMultipartHttpBodyData:String = String(data:multipart.httpBody, encoding:.utf8) ?? "-N/A-"

        if (sMultipartHttpBodyData.count < 1)
        {

            sMultipartHttpBodyData = "-empty-"

        }
        else
        {

            if (sMultipartHttpBodyData.count > 2000)
            {

            //  sMultipartHttpBodyData = sMultipartHttpBodyData.prefix(2000)
                sMultipartHttpBodyData = sMultipartHttpBodyData.subString(startIndex: 0, length: 2000)

            }

        }

        self.xcgLogMsg("\(sCurrMethodDisp) Using 'self.multipartRequestInfo' of [\(String(describing: self.multipartRequestInfo?.toString()))]...")
        self.xcgLogMsg("\(sCurrMethodDisp) Using 'url'                       of [\(url)]...")
        self.xcgLogMsg("\(sCurrMethodDisp) Using 'multipart'                 of [\(multipart)]...")
        self.xcgLogMsg("\(sCurrMethodDisp) Using 'multipart.httpBody'        of [\(String(describing: sMultipartHttpBodyData))]...")
        self.xcgLogMsg("\(sCurrMethodDisp) Using 'request.httpMethod'        of [\(String(describing: request.httpMethod))]...")
        self.xcgLogMsg("\(sCurrMethodDisp) Using 'request.headers'           of [\(String(describing: request.allHTTPHeaderFields))]...")
        self.xcgLogMsg("\(sCurrMethodDisp) Using 'request.httpBody'          of [\(String(describing: request.httpBody))]...")

        self.urlResponse                           = nil
        self.urlResponseData                       = nil

        self.multipartRequestInfo?.urlResponse     = nil
        self.multipartRequestInfo?.urlResponseData = nil

        do
        {

            let (urlResponseData, urlResponse) = try await URLSession.shared.data(for:request)

            self.urlResponse     = urlResponse as? HTTPURLResponse
            self.urlResponseData = urlResponseData

            self.xcgLogMsg("\(sCurrMethodDisp) Returned HTTP 'url' StatusCode is (\(self.urlResponse!.statusCode))...")
            self.xcgLogMsg("\(sCurrMethodDisp) Returned 'url' Response DATA was [\(String(data:self.urlResponseData!, encoding:.utf8)!)]...")

            self.multipartRequestInfo!.urlResponse     = self.urlResponse
            self.multipartRequestInfo!.urlResponseData = self.urlResponseData

        }
        catch
        {

            self.xcgLogMsg("\(sCurrMethodDisp) URLSession invocation threw a try/catch 'Error' - Severe Error!")

        }

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return

    }   // End of public func processMultipartRequest().

}   // End of class MultipartRequestDriver(NSObject).

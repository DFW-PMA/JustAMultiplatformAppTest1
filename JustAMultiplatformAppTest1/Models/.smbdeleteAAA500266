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
        static let sClsVers        = "v1.0201"
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

    func processAppLogUploadZipfile() -> AppLogUploadItem?
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"()'"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked...")

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

        if (self.appLogUploadItem == nil)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) 'self.appLogUploadItem' is Nil - Error!")

            // Exit:

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

            return nil

        }

        if (self.appLogUploadItem!.sAppLogUploadFilespec.count < 1)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Creation of the Zip file failed - the Zip 'source' filespec is 'empty' - Error!")

            // Exit:

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

            return nil

        }

        let sZipSource:String   = self.appLogUploadItem!.sAppLogUploadFilespec
        var sZipFilespec:String = ""

        if (sZipSource.hasSuffix(".zip") == true)
        {

            sZipFilespec = sZipSource

            if (JmFileIO.fileExists(sFilespec: sZipFilespec) == false)
            {

                self.xcgLogMsg("\(sCurrMethodDisp) For the ZipFile [\(sZipFilespec)] - the file does NOT exist - Error!")

                // Exit:

                self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

                return nil

            }

            self.xcgLogMsg("\(sCurrMethodDisp) Uploading the current ZipFile [\(sZipFilespec)] from the Zip 'source' [\(sZipSource)]...")

        }
        else
        {

            sZipFilespec = "AppLog_GeneratedUpLoad.zip"

            self.xcgLogMsg("\(sCurrMethodDisp) Invoking 'self.performZipFileCreation()' to create ZipFile [\(sZipFilespec)] from the Zip 'source' [\(sZipSource)]...")

            let bZipFileCreatedOk = self.performZipFileCreation(sZipFilespec: sZipFilespec, sZipSource: sZipSource)

            self.xcgLogMsg("\(sCurrMethodDisp) Return from 'self.performZipFileCreation()' to create ZipFile [\(sZipFilespec)] from the Zip 'source' [\(sZipSource)] - 'bZipFileCreatedOk' is [\(bZipFileCreatedOk)]...")

            if (bZipFileCreatedOk == false)
            {

                // Exit:

                self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

                return nil

            }

        }

        self.appLogUploadItem!.sAppLogUploadFilespec = sZipFilespec

        self.xcgLogMsg("\(sCurrMethodDisp) The AppLog 'upload' is using the ZipFile [\(sZipFilespec)] from the Zip 'source' [\(sZipSource)]...")

        let sFormBoundary         = self.restURLProcessor!.generateURLRequestBoundaryString()

        let listRequestHeaders    =
        [
            "Content-Type":    "multipart/form-data; boundary=\(sFormBoundary)",
            "appOrigin":       "\(AppGlobalInfo.sGlobalInfoAppId)",
            "appSource":       "\(sZipSource)",
            "appZipFile":      "\(sZipFilespec)",
            "Accept":          "*/*",
            "accept-encoding": "gzip, deflate",
            "cache-control":   "no-cache"
        ]

        let listRequestParameters =
        [
            "Content-Type": "multipart/form-data"
        ]

        var svHttpParams:[String] = Array()

        for (sHttpName, sHttpValue) in listRequestParameters
        {

            svHttpParams.append("\(sHttpName)=\(sHttpValue)")

        }

        self.restURLProcessor!.restURLData!.sHttpURI    = "/dfwpma/file_uploads"
        self.restURLProcessor!.restURLData!.sHttpParams = svHttpParams.joined(separator: "&")

        _ = self.restURLProcessor!.restURLData!.generateHttpURL()

        self.xcgLogMsg("\(sCurrMethodDisp) Zipfile 'loading' - 'sGeneratedHttpURL' [\(self.restURLProcessor!.restURLData!.sHttpGeneratedURL)]...")

        let postUploadRequest = NSMutableURLRequest(url:             NSURL(string: self.restURLProcessor!.restURLData!.sHttpGeneratedURL)! as URL,
                                                    cachePolicy:     .reloadIgnoringLocalCacheData,
                                                    timeoutInterval: 30.0)

        postUploadRequest.httpMethod          = "POST"
        postUploadRequest.allHTTPHeaderFields = listRequestHeaders
        postUploadRequest.httpBody            = self.createHttpBodyFromBinaryFile(asParameters: nil, sFilespec: sZipFilespec, sBoundary: sFormBoundary) as Data

        self.xcgLogMsg("\(sCurrMethodDisp) Zipfile 'loading' - 'postUploadRequest.httpBody' len (\(postUploadRequest.httpBody!.count))...")

        self.restURLProcessor!.jsonRequest               = postUploadRequest
        self.restURLProcessor!.aiJsonResponseStatusCodes = [204]

        self.restURLResponse = self.restURLProcessor!.handleURLRequestWithBasicResponse(reset: true)

        if (self.restURLResponse!.bRestURLQueryOk == false)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) The AppLog 'upload' Request 'postUploadRequest' [\(postUploadRequest)] failed - 'restURLResponse' was [\(self.restURLResponse!)] - Error!")

            // Exit:

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

            return nil

        }

        return self.appLogUploadItem

    } // End of func processAppLogUploadZipfile().

    private func performZipFileCreation(sZipFilespec:String, sZipSource:String) -> Bool
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"()'"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - 'sZipFilespec' [\(sZipFilespec)] - 'sZipSource' [\(sZipSource)]...")

        if (sZipFilespec.count < 1)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Creation of the 'sZipFilespec' [\(sZipFilespec)] failed - the filespec is 'empty' - Error!")

            // Exit:

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

            return false

        }

        var sZipFilespec:String = sZipFilespec

        let sCurrZipFilepath    = (sZipFilespec as NSString).deletingLastPathComponent

        do
        {

            try FileManager.default.createDirectory(atPath: sCurrZipFilepath, withIntermediateDirectories: true, attributes: nil)

        }
        catch
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Creation of the 'sZipFilespec' [\(sZipFilespec)] failed - unable to create the 'path' of [\(sCurrZipFilepath)] - Error: \(error)!")

        }

        if (sZipSource.count < 1)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Creation of the 'sZipFilespec' [\(sZipFilespec)] failed - the zip 'source' is 'empty' - Error!")

            // Exit:

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

            return false

        }

        var sZipFromDir:String                 = sZipSource
        let nsDictItemAttributes:NSDictionary? = try? FileManager.default.attributesOfItem(atPath: sZipFromDir) as NSDictionary

        if (nsDictItemAttributes == nil)
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Creation of the 'sZipFilespec' [\(sZipFilespec)] failed - unable to retrieve the item attributes from a 'source' [\(sZipFromDir)] - Error!")

            // Exit:

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

            return false

        }

        if (nsDictItemAttributes!.fileType() != "NSFileTypeDirectory" &&
            nsDictItemAttributes!.fileType() != "NSFileTypeRegular")
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Creation of the 'sZipFilespec' [\(sZipFilespec)] failed - the item [\(sZipFromDir)] is NOT a valid directory NOR a file - Error!")

            // Exit:

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")

            return false

        }

        let sZipFromDirLower:String = sZipFromDir.lowercased()

        if (nsDictItemAttributes!.fileType()         == "NSFileTypeRegular" ||
            sZipFromDirLower.hasSuffix(".xcodeproj") == true)
        {

            sZipFromDir = (sZipFromDir as NSString).deletingLastPathComponent

        }

        self.xcgLogMsg("\(sCurrMethodDisp) Creating the 'sZipFilespec' [\(sZipFilespec)] from the directory parent 'sZipFromDir' [\(sZipFromDir)]...")

        let sZipTaskExec   = "/usr/bin/zip"
        let pipeStdOut     = Pipe()
        let pipeStdErr     = Pipe()
//        let processZipTask = Process()
//
//        processZipTask.executableURL  = URL(fileURLWithPath: sZipTaskExec)
//        processZipTask.standardOutput = pipeStdOut
//        processZipTask.standardError  = pipeStdErr
//
//        let asZipTaskParmsPrefix =
//        [
//            "-r9",
//            "\(sZipFilespec)",
//            "\(sZipFromDir)"
//        ]
//
//        let asZipTaskParmsSuffix =
//        [
//            "@"
//        ]
//
//        //  "--include",
//        //  "*.swift",
//        //  "*.applescript",
//
//        var bZipParmsAdded = false
//        var asZipTaskParms = asZipTaskParmsPrefix
//
//        if (asInclude       != nil &&
//            asInclude!.count > 0)
//        {
//
//            asZipTaskParms.append("--include")
//
//            asZipTaskParms += asInclude!
//
//            bZipParmsAdded = true
//
//        }
//        else
//        {
//
//            let sCxExtTxt:String? = CxDataRepo.sharedCxDataRepo.retrieveCxDataToCacheFromCxDataRepo(sCxDataCacheKey: "CxExt.txt") as? String
//
//            if (sCxExtTxt        != nil &&
//                sCxExtTxt!.count > 0)
//            {
//
//                let asCxExtTxtInclude = sCxExtTxt!.components(separatedBy: ";")
//
//                 if (asCxExtTxtInclude.count > 0)
//                {
//
//                    asZipTaskParms.append("--include")
//
//                    asZipTaskParms += asCxExtTxtInclude
//
//                    bZipParmsAdded = true
//
//                }
//
//            }
//
//        }
//
//        if (asExclude       != nil &&
//            asExclude!.count > 0)
//        {
//
//            asZipTaskParms.append("--exclude")
//
//            asZipTaskParms += asExclude!
//
//            bZipParmsAdded = true
//
//        }
//
//        if (bZipParmsAdded == true)
//        {
//
//            asZipTaskParms.append(contentsOf: asZipTaskParmsSuffix)
//
//        }
//
//        self.xcgLogMsg("\(sCurrMethodDisp) Create ZipFile [\(sZipFilespec)] with command parameters of [\(asZipTaskParms)]...")
//
//        var bProcessZipTaskOk = true
//
//        processZipTask.arguments = asZipTaskParms
//
//        do
//        {
//
//            try processZipTask.run()
//
//            bProcessZipTaskOk = true
//
//        }
//        catch let error as NSError
//        {
//
//            self.xcgLogMsg("\(sCurrMethodDisp) Failed to create ZipFile [\(sZipFilespec)] - Error: [\(error.domain)]!")
//
//            bProcessZipTaskOk = false
//
//        }
//
//        let dataStdOut = pipeStdOut.fileHandleForReading.readDataToEndOfFile()
//        let sStdOutput = String(decoding: dataStdOut, as: UTF8.self)
//
//        let dataStdErr = pipeStdErr.fileHandleForReading.readDataToEndOfFile()
//        let sStdError  = String(decoding: dataStdErr, as: UTF8.self)
//
//        self.xcgLogMsg("\(sCurrMethodDisp) ZipFile process 'stdout' was [\(sStdOutput)]...")
//        self.xcgLogMsg("\(sCurrMethodDisp) ZipFile process 'stderr' was [\(sStdError)]...")
//
//        if (bProcessZipTaskOk == false)
//        {
//
//            // Exit:
//
//            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")
//
//            return false
//
//        }
//
//        if (JmFileIO.fileExists(sFilespec: sZipFilespec) == false)
//        {
//
//            self.xcgLogMsg("\(sCurrMethodDisp) Failed to create ZipFile [\(sZipFilespec)] - the file does NOT exist!")
//
//            // Exit:
//
//            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")
//
//            return false
//
//        }
//
//        let nsDictFileAttributes:NSDictionary? = try? FileManager.default.attributesOfItem(atPath: sZipFilespec) as NSDictionary
//
//        if (nsDictFileAttributes == nil)
//        {
//
//            self.xcgLogMsg("\(sCurrMethodDisp) Creation of the 'sZipFilespec' [\(sZipFilespec)] failed - unable to retrieve the File attributes - Error!")
//
//            // Exit:
//
//            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")
//
//            return false
//
//        }
//
//        if (nsDictFileAttributes!.fileType() != "NSFileTypeRegular")
//        {
//
//            self.xcgLogMsg("\(sCurrMethodDisp) Creation of the 'sZipFilespec' [\(sZipFilespec)] failed - it is NOT a valid file - Error!")
//
//            // Exit:
//
//            self.xcgLogMsg("\(sCurrMethodDisp) Exiting with Error!")
//
//            return false
//
//        }
//
//        let cZipFileSize:UInt64            = nsDictFileAttributes!.fileSize()
//        let sScanProcessorStatusMsg:String = "Successfully created the ZipFile [\(sZipFilespec)] - the file exists and contains (\(cZipFileSize)) byte(s)..."
//
//        self.xcgLogMsg("\(sCurrMethodDisp) \(sScanProcessorStatusMsg)")

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return true

    } // End of private func performZipFileCreation().

    private func createHttpBodyFromBinaryFile(asParameters:[String: String]? = nil, sFilespec: String, sBoundary: String) -> NSData
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "'"+sCurrMethod+"()'"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - 'asParameters' [\(String(describing: asParameters))] - 'sFilespec' [\(sFilespec)] - 'sBoundary' [\(sBoundary)]...")

        let httpBody = NSMutableData()

        if asParameters != nil
        {

            for (sParmKey, sParmValue) in asParameters!
            {

                httpBody.append("--\(sBoundary)\r\n".data(using: String.Encoding.utf8)!)
                httpBody.append("Content-Disposition: form-data; name=\"\(sParmKey)\"\r\n\r\n".data(using: String.Encoding.utf8)!)
                httpBody.append("\(sParmValue)\r\n".data(using: String.Encoding.utf8)!)

            }

        }

    //  let sFilename           = sFilespec.lastPathComponent ?? "nil"
        let sFilename           = "PHP-Mailer.zip"
        let sMimeType           = "application/zip"
        var zipFileData:NSData  = NSData()

        do
        {

            zipFileData = try NSData(contentsOfFile: sFilespec, options: NSData.ReadingOptions.mappedIfSafe)

            // Delay for 1/4th of a second to allow the system to completely load the target file...

            usleep(250000)

        }
        catch let error as NSError
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Failed to read file [\(sFilespec)] - Error: [\(error.domain)]!")

            zipFileData = NSData()

        }

        self.xcgLogMsg("\(sCurrMethodDisp) 'zipFileData' has a length of (\(String(describing: zipFileData.length))) bytes...")

        httpBody.append("--\(sBoundary)\r\n".data(using: String.Encoding.utf8)!)
        httpBody.append("Content-Disposition:form-data; name=\"zippedSource\"; filename=\"\(sFilename)\"\r\n".data(using: String.Encoding.utf8)!)
        httpBody.append("Content-Type: \(sMimeType)\r\n\r\n".data(using: String.Encoding.utf8)!)
    //  httpBody.append("Content-Type: \(sMimeType)\r\n".data(using: String.Encoding.utf8)!)
    //  httpBody.append("--\(sBoundary)\r\n".data(using: String.Encoding.utf8)!)
        httpBody.append(zipFileData as Data)
        httpBody.append("\r\n\r\n".data(using: String.Encoding.utf8)!)
    //  httpBody.append("--\(sBoundary)--\r\n\r\n\r\n\r\n".data(using: String.Encoding.utf8)!)
    //  httpBody.append("--\(sBoundary)--".data(using: String.Encoding.utf8)!)
        httpBody.append("--\(sBoundary)--\r\n".data(using: String.Encoding.utf8)!)

        self.xcgLogMsg("\(sCurrMethodDisp) Created 'httpBody' contains (\(httpBody.length)) bytes...")

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting...")

        return httpBody

    } // End of func createHttpBodyFromBinaryFile().

} // End of class AppLogUploadProcessor.

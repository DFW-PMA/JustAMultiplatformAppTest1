//
//  MultipartZipFileCreator.swift
//  JustAMultipartRequestTest1
//
//  Created by JustMacApps.net on 09/10/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import Foundation

class MultipartZipFileCreator: NSObject
{

    struct ClassInfo
    {
        
        static let sClsId          = "MultipartZipFileCreator"
        static let sClsVers        = "v1.0101"
        static let sClsDisp        = sClsId+"(.swift).("+sClsVers+"):"
        static let sClsCopyRight   = "Copyright (C) JustMacApps 2023-2024. All Rights Reserved."
        static let bClsTrace       = true
        static let bClsFileLog     = true
        
    }

    // App Data field(s):

    private var bInternalTest:Bool                        = false
    private let bGenerateInternalTextFiles:Bool           = true

            var jmAppDelegateVisitor:JmAppDelegateVisitor = JmAppDelegateVisitor.ClassSingleton.appDelegateVisitor

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

    public func createTargetZipFileFromSource(multipartRequestInfo:MultipartRequestInfo)->URL?
    {

        let sCurrMethod:String = #function
        let sCurrMethodDisp    = "\(ClassInfo.sClsDisp)'"+sCurrMethod+"':"

        self.xcgLogMsg("\(sCurrMethodDisp) Invoked - parameter 'multipartRequestInfo' is [\(multipartRequestInfo.toString())]...")

        var urlForZipOperations:URL = URL(string:multipartRequestInfo.sAppSourceFilespec)!

        if (self.bGenerateInternalTextFiles == true) 
        {

            urlForZipOperations = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

            // Populate the App's 'documents' directory with some example files:

            for i in 1...10 
            {

                let fileUrl   = urlForZipOperations.appendingPathComponent("\(i).txt")
                let sContents = "This is file #(\(i))..."

                try! sContents.write(to: fileUrl, atomically: true, encoding: .utf8)

            }

        }

        // Check the accessibility of the 'urlForZipOperations'...

        self.xcgLogMsg("\(sCurrMethodDisp) Creating a Zip file from the URL 'urlForZipOperations' of [\(urlForZipOperations)]...")

    //  var sForZipOperationsIsFile:Bool      = false
    //  var sForZipOperationsIsDirectory:Bool = false
    //  let sForZipOperations:String          = urlAppDelegateVisitorLogFilespec?.path
    //
    //  let nsDictItemAttributes:NSDictionary? = try? FileManager.default.attributesOfItem(atPath: sForZipOperations) as NSDictionary
    //
    //  if (nsDictItemAttributes == nil)
    //  {
    //
    //      // Exit:
    //
    //      self.xcgLogMsg("\(sCurrMethodDisp) Exiting - Can NOT determine the attributes of 'urlCreatedZipFile' of [\(String(describing: urlCreatedZipFile))] - Error!")
    //
    //      return nil
    //
    //  }
    //
    //  if (nsDictItemAttributes!.fileType() = "NSFileTypeDirectory")
    //  {
    //
    //      sForZipOperationsIsFile      = false
    //      sForZipOperationsIsDirectory = true
    //
    //      self.xcgLogMsg("\(sCurrMethodDisp) The URL 'urlForZipOperations' of [\(urlForZipOperations)] is a 'directory'...")
    //
    //  }
    //  else
    //  {
    //
    //      sForZipOperationsIsFile      = true
    //      sForZipOperationsIsDirectory = false
    //
    //      self.xcgLogMsg("\(sCurrMethodDisp) The URL 'urlForZipOperations' of [\(urlForZipOperations)] is a 'file'...")
    //
    //  }



        var urlCreatedZipFile:URL?              = nil                   // URL of the Zip file (created)...
        var nsError:NSError?                    = nil                   // Store an encountered 'NSError'...
        let nsFileCoordinator:NSFileCoordinator = NSFileCoordinator()

        // Zip the documents directory
        // This block is synchronous and the block will be executed before it returns
        // If the method fails, the block will not be executed though
        // If you expect the archiving process to take long, execute it on another queue:

        nsFileCoordinator.coordinate(readingItemAt:urlForZipOperations, options:[.forUploading], error:&nsError) 
        { (urlFileToAddToZip) in

            self.xcgLogMsg("\(sCurrMethodDisp) NSFileCoordinator: 'urlFileToAddToZip' is [\(urlFileToAddToZip)]...")

            // 'urlFileToAddToZip' points to the file iterated by the 'nsFileCoordinator' and
            // is valid ONLY until the end of this block, so the file MUST be moved to a temporary folder:

            let urlTempFile = try! FileManager.default.url(for:            .itemReplacementDirectory,
                                                           in:             .userDomainMask,
                                                           appropriateFor: urlFileToAddToZip,
                                                           create:         true
                                                           )
                                                           .appendingPathComponent(multipartRequestInfo.sAppZipFilename)

            self.xcgLogMsg("\(sCurrMethodDisp) URL 'urlFileToAddToZip' of [\(urlFileToAddToZip)] created the 'urlTempFile' of [\(urlTempFile)]...")

            try! FileManager.default.moveItem(at:urlFileToAddToZip, to:urlTempFile)

            self.xcgLogMsg("\(sCurrMethodDisp) URL 'urlFileToAddToZip' of [\(urlFileToAddToZip)] moved to the 'urlTempFile' of [\(urlTempFile)]...")

            // Store the URL so we can use it outside the block:

            urlCreatedZipFile = urlTempFile

        }

        if let urlCreatedZipFile = urlCreatedZipFile 
        {

        // Bring up the 'share' sheet so we can send the 'urlTargetZipFile' with AirDrop (for example):
        //     let avc = UIActivityViewController(activityItems: [urlCreatedZipFile], applicationActivities: nil)
        //     present(avc, animated: true)

            self.xcgLogMsg("\(sCurrMethodDisp) Produced a Zip file 'urlCreatedZipFile' of [\(urlCreatedZipFile)]...")

        } 
        else 
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Failed to produce a Zip file - 'nsError' is [\(String(describing: nsError))] - the supplied URL 'urlForZipOperations' was [\(urlForZipOperations)] - Error!")

        }

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'urlCreatedZipFile' is [\(String(describing: urlCreatedZipFile))]...")

        return urlCreatedZipFile

    }   // End of func createTargetZipFileFromSource().

}   // End of class MultipartZipFileCreator(NSObject).


//
//  MultipartZipFileCreator.swift
//  JustAMultipartRequestTest1
//
//  Created by JustMacApps.net on 09/10/2024.
//  Copyright © 2023-2024 JustMacApps. All rights reserved.
//

import Foundation
import SwiftUI

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

        if (self.jmAppDelegateVisitor.bForZipOperationsFilespecIsUsable == true)
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

        var urlCreatedZipFile:URL?                    = nil     // URL of the Zip file (created)...
        var urlForZipOperationsSource:URL?            = URL(string:multipartRequestInfo.sAppSourceFilespec)!
        var urlForZipOperationsTarget:URL?            = URL(string:multipartRequestInfo.sAppZipFilename)!
        var sForZipOperationsSourceFilespec:String    = self.urlForZipOperationsSource?.path
        var sForZipOperationsTargetFilename:String    = self.urlForZipOperationsTarget?.path

        // Check that we have a 'target' file (string) that is NOT nil...

        if (sForZipOperationsTargetFilespec.count < 1)
        {

            self.xcgLogMsg("[\(sCurrMethodDisp)] Unable to Zip the 'source' filespec of [\(String(describing: sForZipOperationsSourceFilespec))] - the 'target' Zip filename is 'nil' - Error!")

            // Exit:

            urlCreatedZipFile = nil

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'urlCreatedZipFile' is [\(String(describing: urlCreatedZipFile))]...")

            return urlCreatedZipFile

        }

        // Check that we have a 'source' file to zip (or if 'testing' make sure we have one)...

        let bIsForZipOperationsSourceFilePresent:Bool = JmFileIO.fileExists(sFilespec:self.sForZipOperationsSourceFilespec)

        if (bIsForZipOperationsSourceFilePresent == true)
        {

            self.xcgLogMsg("[\(sCurrMethodDisp)] Preparing to Zip the 'source' filespec of [\(String(describing: sForZipOperationsSourceFilespec))]...")

        }
        else
        {

            if (self.bGenerateInternalTextFiles == false)
            {
                
                self.xcgLogMsg("[\(sCurrMethodDisp)] Unable to Zip the 'source' filespec of [\(String(describing: sForZipOperationsSourceFilespec))] - the file does NOT Exist - Error!")

                // Exit:

                urlCreatedZipFile = nil

                self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'urlCreatedZipFile' is [\(String(describing: urlCreatedZipFile))]...")

                return urlCreatedZipFile

            } 
            else
            {

                do 
                {

                    var urlForZipOperationsFilepath = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask ,appropriateFor: nil, create: true)
                    var urlForZipOperationsFilespec = urlForZipOperationsFilepath?.appendingPathComponent("Test-for-Zip_1.txt")
                    var sForZipOperationsFilespec   = urlForZipOperationsFilespec?.path
                    var sForZipOperationsFilepath   = urlForZipOperationsFilepath?.path

                    self.xcgLogMsg("[\(sCurrMethodDisp)] 'self.sForZipOperationsFilespec' (computed) is [\(String(describing: self.sForZipOperationsFilespec))]...")
                    self.xcgLogMsg("[\(sCurrMethodDisp)] 'self.sForZipOperationsFilepath' (resolved #1) is [\(String(describing: self.sForZipOperationsFilepath))]...")

                    let bIsForZipOperationsFilePresent:Bool = JmFileIO.fileExists(sFilespec:sForZipOperationsFilespec)

                    if (bIsForZipOperationsFilePresent == true)
                    {

                        self.xcgLogMsg("[\(sCurrMethodDisp)] Zipping the 'source' Filespec of [\(String(describing: sForZipOperationsFilespec))]...")

                        sForZipOperationsSourceFilespec = sForZipOperationsFilespec

                    }
                    else
                    {

                        try FileManager.default.createDirectory(atPath: self.sForZipOperationsFilepath, withIntermediateDirectories: true, attributes: nil)

                        let sGeneratedFileContents:String = "\(sCurrMethodDisp) Invoked - 'sApplicationName' is [\(AppGlobalInfo.sApplicationName)] - 'self' is [\(self)]...\r\nThis is an 'auto' generated file used for 'testing'..."

                        try sGeneratedFileContents.write(toFile: self.sForZipOperationsFilespec, atomically:true, encoding:String.Encoding.utf8)

                        self.xcgLogMsg("[\(sCurrMethodDisp)] Successfully created the 'path' of [.documentDirectory] and the 'source' filespec of [\(String(describing: self.sForZipOperationsFilespec))]...")

                        sForZipOperationsSourceFilespec = sForZipOperationsFilespec

                    }

                }
                catch
                {

                    self.xcgLogMsg("[\(sCurrMethodDisp)] Failed to create the 'path' of [.documentDirectory] - Details: \(error) - Error!")

                    // Exit:

                    urlCreatedZipFile = nil

                    self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'urlCreatedZipFile' is [\(String(describing: urlCreatedZipFile))]...")

                    return urlCreatedZipFile

                }

            }

        }

        // Zip the 'source' file to the 'target' Zip file...

        self.xcgLogMsg("[\(sCurrMethodDisp)] Zipping the 'source' filespec of [\(String(describing: sForZipOperationsSourceFilespec))] to the 'target' Zip filename of [\(sForZipOperationsTargetFilename)]...")

        do
        {

            let urlForSourceFilespec:URL? = URL(string:sForZipOperationsSourceFilespec)!
            let urlForTargetZipFile:URL?  = FileManager.default.temporaryDirectoryappendingPathComponent(sForZipOperationsTargetFilename)
            let zipArchiver:ZipArchive    = ZipArchive()

            try zipArchiver.createZipFile(at:urlForTargetZipFile, withContentsOf:urlForSourceFilespec, options:.default)

            multipartRequestInfo.dataAppFile      = try Data(contentsOf:urlForTargetZipFile)
            multipartRequestInfo.sAppFileMimeType = "application/zip"

            urlCreatedZipFile                     = urlForTargetZipFile

        }
        catch
        {

            self.xcgLogMsg("[\(sCurrMethodDisp)] Failed to create the 'target' Zip file [\(sForZipOperationsTargetFilename)] - Error!")

            // Exit:

            urlCreatedZipFile = nil

            self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'urlCreatedZipFile' is [\(String(describing: urlCreatedZipFile))]...")

            return urlCreatedZipFile

        }

        // Check if we actually got the 'target' Zip file created...

        if let urlCreatedZipFile = urlCreatedZipFile 
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Produced a Zip file 'urlCreatedZipFile' of [\(urlCreatedZipFile)]...")

        } 
        else 
        {

            self.xcgLogMsg("\(sCurrMethodDisp) Failed to produce a Zip file - the 'target' Zip filename was [\(sForZipOperationsTargetFilename)] - Error!")

            urlCreatedZipFile = nil

        }

        // Exit:

        self.xcgLogMsg("\(sCurrMethodDisp) Exiting - 'urlCreatedZipFile' is [\(String(describing: urlCreatedZipFile))]...")

        return urlCreatedZipFile

    }   // End of func createTargetZipFileFromSource().

}   // End of class MultipartZipFileCreator(NSObject).

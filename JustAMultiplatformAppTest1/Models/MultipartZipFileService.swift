//
// MultipartZipFileService.swift
//

import Foundation

// MARK: - Extensions

extension URL 
{

    var isDirectory: Bool 
    {

       (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true

    }

}   // END of extension URL.

// MARK: - Errors

enum CreateZipError:Swift.Error 
{

    case urlNotADirectory(URL)
    case failedToCreateZIP(Swift.Error)
    case failedToGetDataFromZipURL

}   // END of enum CreateZipError:Swift.Error.

// MARK: - FileToZip

enum FileToZip 
{

    case data(Data, filename:String)
    case existingFile(URL)
    case renamedFile(URL, toFilename:String)

}   // END of enum FileToZip.

extension FileToZip 
{

    static func text(_ text:String, filename:String)->FileToZip 
    {

        .data(text.data(using: .utf8) ?? Data(), filename: filename)

    }   // END of static func text(_ text:String, filename:String)->FileToZip

}   // END of extension FileToZip.

extension FileToZip 
{

    func prepareInDirectory(directoryURL:URL) throws 
    {

        switch self 
        {
        case .data(let data, filename:let filename):
            let fileURL = directoryURL.appendingPathComponent(filename)
            try data.write(to: fileURL)
        case .existingFile(let existingFileURL):
            let filename   = existingFileURL.lastPathComponent
            let newFileURL = directoryURL.appendingPathComponent(filename)
            try FileManager.default.copyItem(at:existingFileURL, to:newFileURL)
        case .renamedFile(let existingFileURL, toFilename:let filename):
            let newFileURL = directoryURL.appendingPathComponent(filename)
            try FileManager.default.copyItem(at:existingFileURL, to:newFileURL)
        }

    }   // END of func prepareInDirectory(directoryURL:URL) throws.

}   // END of extension FileToZip.

// MARK: - ZipService

//final class MultipartZipFileService 
class MultipartZipFileService: NSObject 
{

    var shouldOverwriteIfNecessary:Bool = false
    
    override init()
    {

    }

    func createZip(zipFinalURL:URL, fromDirectory directoryURL:URL)throws->URL 
    {

        // See URL extension below...

        guard directoryURL.isDirectory 
        else { throw CreateZipError.urlNotADirectory(directoryURL) }
        
        var fileManagerError:Swift.Error?
        var coordinatorError:NSError?

        let coordinator = NSFileCoordinator()

        coordinator.coordinate(readingItemAt:directoryURL, options:.forUploading, error:&coordinatorError) 
        { zipAccessURL in

            do 
            {

                if (shouldOverwriteIfNecessary)
                {

                    let _ = try FileManager.default.replaceItemAt(zipFinalURL, withItemAt:zipAccessURL)

                } 
                else 
                {

                    try FileManager.default.moveItem(at:zipAccessURL, to:zipFinalURL)

                }

            } 
            catch 
            {

                fileManagerError = error

            }

        }

        if let error = (coordinatorError ?? fileManagerError)
        {

            throw CreateZipError.failedToCreateZIP(error)

        }

        return zipFinalURL

    }   // END of func createZip(zipFinalURL:URL, fromDirectory directoryURL:URL)throws->URL.

    func createZipAtTmp(zipFilename:String, zipExtension:String="zip", fromDirectory directoryURL:URL)throws->URL 
    {

        let finalURL = FileManager.default.temporaryDirectory.appending(path:zipFilename).appendingPathExtension(zipExtension)

        return try createZip(zipFinalURL:finalURL, fromDirectory:directoryURL)

    }   // END of func createZipAtTmp(zipFilename:String, zipExtension:String="zip", fromDirectory directoryURL:URL)throws->URL.

    func createZipAtTmp(zipFilename:String, zipExtension:String="zip", filesToZip:[FileToZip])throws->URL 
    {

        let directoryToZipURL = FileManager.default.temporaryDirectory.appending(path:UUID().uuidString).appending(path:zipFilename)

        try FileManager.default.createDirectory(at:directoryToZipURL, withIntermediateDirectories:true, attributes:[:])

        for fileToZip in filesToZip 
        {

            try fileToZip.prepareInDirectory(directoryURL:directoryToZipURL)

        }

        return try createZipAtTmp(zipFilename:zipFilename, zipExtension:zipExtension, fromDirectory:directoryToZipURL)

    }   // END of func createZipAtTmp(zipFilename:String, zipExtension:String="zip", filesToZip:[FileToZip])throws->URL.
    
    private func getZipData(zipFileURL:URL)throws->Data 
    {

        if let data = FileManager.default.contents(atPath:zipFileURL.path)
        {

            return data

        } 
        else 
        {

            throw CreateZipError.failedToGetDataFromZipURL

        }

    }   // END of private func getZipData(zipFileURL:URL)throws->Data.

    func getZipData(zipFilename:String=UUID().uuidString, fromDirectory directoryURL:URL)throws->Data 
    {

        let zipURL = try createZipAtTmp(zipFilename:zipFilename, fromDirectory:directoryURL)

        return try getZipData(zipFileURL:zipURL)

    }   // END of func getZipData(zipFilename:String=UUID().uuidString, fromDirectory directoryURL:URL)throws->Data.
    
    func getZipData(zipFilename:String=UUID().uuidString, filesToZip:[FileToZip])throws->Data 
    {

        let zipURL = try createZipAtTmp(zipFilename:zipFilename, filesToZip:filesToZip)

        return try getZipData(zipFileURL:zipURL)

    }   // END of func getZipData(zipFilename:String=UUID().uuidString, filesToZip:[FileToZip])throws->Data.

}   // END of final class MultipartZipFileService.

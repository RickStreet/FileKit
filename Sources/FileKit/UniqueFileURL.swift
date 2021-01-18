//
//  GetUniqueURL.swift
//  DmcRga
//
//  Created by Rick Street on 4/20/17.
//  Copyright © 2017 Rick Street. All rights reserved.
//

import Cocoa
import StringKit

public class UniqueFileURL {
    
    // create unique file name xxxx-nnn.ttt
    
    
    /// Generate new file name in form xxx-nnn.ttt
    /// - Parameter fullFileName: Original full file name string
    public func newURL(fileURL: URL) -> URL {
        let fullFileName = fileURL.path
        let fm = FileManager.default
        var i = 0
        // let newExt = ext(file: fullFileName)
        let newExt = fullFileName.fileExtension() ?? ""
        let baseFile = fullFileName.fileBaseNoVersion()
        var newFullFileName = ""
        
        repeat {
            i += 1
            newFullFileName = baseFile + "-" + String(format: "%03d", i) + newExt
            // newFullFileName = baseNoVersion(file: fullFileName) + "-" + String(format: "%03d", i) + newExt
            print("newFullFileName \(newFullFileName)")
        } while fm.fileExists(atPath: newFullFileName)

        return URL(fileURLWithPath: newFullFileName)  
    }
    
    /*
    func dir(fullFileName: String) -> String {
        if let index = fullFileName.reverseIndexOf("/") {
            // return fullFileName.substring(to: index)
            return String(fullFileName[...index])
        }
        return fullFileName
    }
    */
    
    /*
    func file(fullFileName: String) -> String {
        if let index = fullFileName.reverseIndexOf("/") {
            // return fullFileName.substring(from: index)
            return String(fullFileName[index...])
        }
        return fullFileName
        
    }
    */
    
    public init() {
        
    }
    
    
}


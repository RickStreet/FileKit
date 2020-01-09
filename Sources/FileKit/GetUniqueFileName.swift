//
//  GetUniqueURL.swift
//  DmcRga
//
//  Created by Rick Street on 4/20/17.
//  Copyright © 2017 Rick Street. All rights reserved.
//

import Cocoa
import StringKit

class GetUniqueFileName {
    
    // create unique file name xxxx-nnn.ttt
    
    
    /// Generate new file name in form xxx-nnn.ttt
    /// - Parameter fullFileName: Original full file name string
    func newName(fullFileName: String) -> URL {
        let fm = FileManager.default
        var i = 0
        let newExt = ext(file: fullFileName)
        var newFullFileName = ""
        
        repeat {
            i += 1
            newFullFileName = base(file: fullFileName) + "-" + String(format: "%03d", i) + newExt
            print("newFullFileName \(newFullFileName)")
        } while fm.fileExists(atPath: newFullFileName)

        return URL(fileURLWithPath: newFullFileName)  
    }
    
    func dir(fullFileName: String) -> String {
        if let index = fullFileName.reverseIndexOf("/") {
            // return fullFileName.substring(to: index)
            return String(fullFileName[...index])
        }
        return fullFileName
    }
    
    // file name before "-"
    func base(file: String) -> String {
        if let i = file.indexBefore("-") {
            // return file.substring(to: i)
            return String(file[...i])
        }
        if let i = file.indexBefore(".") {
            // return file.substring(to: i)
            return String(file[...i])
        }
        return file
    }
    
    func file(fullFileName: String) -> String {
        if let index = fullFileName.reverseIndexOf("/") {
            // return fullFileName.substring(from: index)
            return String(fullFileName[index...])
        }
        return fullFileName
        
    }
    
    func ext(file: String) -> String {
        if let i = file.indexOf(".") {
            // return file.substring(from: i)
            return String(file[i...])
        }
        return ""
    }
    
}


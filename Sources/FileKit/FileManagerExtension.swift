//
//  FileManagerExtension.swift
//  LinReg
//
//  Created by Rick Street on 2/2/22.
//  Copyright © 2022 Rick Street. All rights reserved.
//

import Foundation
extension FileManager {

    public func secureCopyItem(at srcURL: URL, to dstURL: URL) -> Bool {
        do {
            if FileManager.default.fileExists(atPath: dstURL.path) {
                try FileManager.default.removeItem(at: dstURL)
            }
            try FileManager.default.copyItem(at: srcURL, to: dstURL)
        } catch (let error) {
            print("Cannot copy item at \(srcURL) to \(dstURL): \(error)")
            return false
        }
        return true
    }

}

//
//  File 2.swift
//  
//
//  Created by Rick Street on 2/2/22.
//

import Foundation
import UniformTypeIdentifiers

@available(macOS 11.0, *)
public extension UTType {
    static var vls: UTType {
        UTType.types(tag: "vls", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var ccf: UTType {
        UTType.types(tag: "ccf", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var mdl: UTType {
        UTType.types(tag: "mdl", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var dpa: UTType {
        UTType.types(tag: "dpa", tagClass: .filenameExtension, conformingTo: nil).first!
    }

}

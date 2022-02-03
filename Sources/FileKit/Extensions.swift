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
    //Word documents are not an existing property on UTType
    static var vls: UTType {
        UTType.types(tag: "vls", tagClass: .filenameExtension, conformingTo: nil).first!
    }
}

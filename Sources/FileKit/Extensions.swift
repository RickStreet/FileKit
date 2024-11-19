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
    static var vec: UTType {
        UTType.types(tag: "vec", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var dpv: UTType {
        UTType.types(tag: "dpv", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var cle: UTType {
        UTType.types(tag: "cle", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var clc: UTType {
        UTType.types(tag: "clc", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var ext: UTType {
        UTType.types(tag: "ext", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var xlsx: UTType {
        UTType.types(tag: "xlsx", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var plist: UTType {
        UTType.types(tag: "plist", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var csv: UTType {
        UTType.types(tag: "csv", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var tsv: UTType {
        UTType.types(tag: "tsv", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var json: UTType {
        UTType.types(tag: "json", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    static var sqlite: UTType {
        UTType.types(tag: "sqlite", tagClass: .filenameExtension, conformingTo: nil).first!
    }
    // Template file
    static var tmp: UTType {
        UTType.types(tag: "tmp", tagClass: .filenameExtension, conformingTo: nil).first!
    }



}
